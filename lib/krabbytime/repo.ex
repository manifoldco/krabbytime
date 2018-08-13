defmodule Krabbytime.Repo do
  # Videos come from here:
  # https://www.youtube.com/channel/UCjfmzjLRyiwgMnZ2pltNSlQ/videos

  # Fallback when we have no match
  @fallback %{code: "6lW3uqezbb0",
      number: 19,
      text: "Uhhh...",
      # Justification: 10 to 15 mins is too long for a code build :)
      start: 10 * 60,
      end: 15 * 60}

  @videos [
    %{code: "AiUYQWvcgew",
      number: 150,
      text: "One pathetic sob story later...",
      start: 2 * 60,
      end: 5 * 60},
    %{code: "2qOWxk7MglU",
      number: 147,
      text: "One nap later...",
      start: 30 * 60,
      end: 60 * 60},
    %{code: "08UFRyNHAsc",
      number: 148,
      text: "One very long digestive tract later...",
      # source: https://www.mayoclinic.org/digestive-system/expert-answers/faq-20058340
      start: 39 * 60 * 60,
      end: 55 * 60 * 60},
    @fallback,
  ]

  def get(seconds) do
    in_range? = fn(v) -> v.start <= seconds && v.end >= seconds end
    candidates = for v <- @videos, in_range?.(v), do: v.code

    code = if length(candidates) == 0 do
      @fallback.code
    else
      Enum.random(candidates)
    end

    "https://img.youtube.com/vi/#{code}/maxresdefault.jpg"
  end
end
