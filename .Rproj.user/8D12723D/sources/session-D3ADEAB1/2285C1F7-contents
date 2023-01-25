local p = quarto.log.output
local str = pandoc.utils.stringify

local function add_speaker_style(raw_block)
  local styler = {
    Div = function(el)
      if el.classes:includes('notes') then
        el.content:insert(raw_block)
        return el
      end
    end
  }
  return styler
end

--if quarto.doc.isFormat("revealjs") then


function Pandoc(doc)
  local meta = doc.meta
  if meta.speaker_notes_style then
    --p(str(meta.speaker_notes_style))
    local sh = io.open(str(meta.speaker_notes_style))
    if not sh then
      io.stderr:write("Cannot open file " .. meta.speaker_notes_style .. " | Skipping adding styles\n")
    else
      local styles = sh:read("a")
      --p(styles)
      sh:close()
      local rb_str = "<style>" .. "\n\n" .. styles .. "\n\n" .. "</style>"
      local raw_block = pandoc.RawBlock('html', rb_str)
      --p(raw_block)
      return doc:walk(add_speaker_style(raw_block))
    end
  end
end 
  