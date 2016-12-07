class Bottles
  def song
    <<-VERSES
#{ phrases(99, 0) }
    VERSES
  end

  def verses(to, from)
    <<-VERSES
#{ phrases(to, from) }
    VERSES
  end

  def verse(phrase_number)
    <<-VERSE
#{ mount_phrase(phrase_number) }
    VERSE
  end

  private

  def phrases(to, from)
    (from..to).map do |index|
      mount_phrase(index)
    end.reverse.join("\n\n")
  end

  def mount_phrase(phrase_number)
    "#{ phrase_one(phrase_number) }\n#{ phrase_two(phrase_number) }"
  end

  def phrase_one(phrase_number)
    "#{ pluralize_bottle(phrase_number).capitalize } of beer on the wall, #{ pluralize_bottle(phrase_number) } of beer."
  end

  def phrase_two(phrase_number)
    return go_to_the_store if phrase_number - 1 < 0
    "Take #{ pluralize_how_many(phrase_number) } down and pass it around, #{ pluralize_bottle(phrase_number - 1)} of beer on the wall."
  end

  def go_to_the_store
    "Go to the store and buy some more, 99 bottles of beer on the wall."
  end

  def pluralize_bottle(phrase_number)
    case phrase_number
    when -1..0
      'no more bottles'
    when 1
      "#{ phrase_number } bottle"
    when 2..99
      "#{ phrase_number } bottles"
    end
  end

  def pluralize_how_many(phrase_number)
    phrase_number > 1 ? 'one' : 'it'
  end
end
