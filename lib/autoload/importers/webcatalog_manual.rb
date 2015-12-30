# frozen-string-literal: true

class Importers::WebcatalogManual
  WDAYS_JA = %w(日 月 火 水 木 金 土).map(&:freeze).freeze

  def initialize(event)
    @event = event
    raise TypeError, "event is not a kind of Event" unless event.kind_of?(Event)
  end

  attr_reader :event

  # var ks = ['webcatalog-circle-id', 'webcatalog-circle-name', 'webcatalog-circle-circlecut', 'webcatalog-circle-day', 'webcatalog-circle-hall', 'webcatalog-circle-block', 'webcatalog-circle-space', 'webcatalog-favorite-color', 'title'];
  # var out = [];
  # $('.webcatalog-circle-list-detail').each ( function() { var self = $(this); var o = {}; ks.forEach(function(v) { o[v] = self.data(v) || self.attr(v) }); out.push(o); });
  # console.log(JSON.stringify(out));.
  
  def import_raw_entries(raw_entries)
    ActiveRecord::Base.transaction do
      raw_entries.flat_map do |entry|
        next unless entry["webcatalog-circle-space"]
        wday = WDAYS_JA.index(entry['webcatalog-circle-day'].to_s.strip)
        day = begin
          i = 0
          i += 1 until (event.starts_at + i.day).wday == wday
          i
        end

        number = entry['webcatalog-circle-space'][0..-2].to_i
        ab = entry['webcatalog-circle-space'][-1]

        import(
          id: entry['webcatalog-circle-id'].to_s,
          name: entry['webcatalog-circle-name'].to_s.tr('ａ-ｚＡ-Ｚ０-９', 'a-zA-Z0-9'),
          circlecut: entry['webcatalog-circle-circlecut'],
          day: day.succ,
          block: entry['webcatalog-circle-block'],
          number: number,
          ab: ab,
        )
      end
    end
  end

  def import(id:, name:, circlecut:, day:, block:, number:, ab:)
    log = []
    info = @event.webcatalog_informations.find_or_initialize_by(webcatalog_id_str: id)

    info.name = name
    info.circlecut_url = circlecut
    info.placement_day = day
    info.placement_block = block
    info.placement_number = number
    info.placement_ab = ab

    case
    when !info.persisted?
      log << "Create info: #{info.id}/#{info.webcatalog_id_str}: #{info.name} (#{info.placement})"
    when info.changed?
      log << "Update info: #{info.id}/#{info.webcatalog_id_str}: #{info.name} (#{info.placement})"
    end

    unless info.participation
      candidate = @event.participations.find_by(placement_day: day, placement_block: block, placement_number: number, placement_ab: ab)
      if candidate
        info.participation = candidate
        log << "Participation link: info=#{info.id} (#{info.webcatalog_id_str}) | participation=#{candidate.id} (circle=#{candidate.circle.name})"
      else
        circle = Circle.find_or_create_by!(name: info.name)
        info.participation = @event.participations.create!(
          circle: circle,
          placement_day: day, placement_block: block, placement_number: number, placement_ab: ab
        )
        log << "Participation created: info=#{info.id} (#{info.webcatalog_id_str}) | participation=#{info.participation.id} (circle=#{circle.name})"
      end
    end

    info.save!
    log
  end
end
