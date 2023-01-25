local str = pandoc.utils.stringify

-- Inserts raw block of css style to each notes Div
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


if quarto.doc.is_format('revealjs') then
  function Pandoc(doc)
    local meta = doc.meta
    local fpath = str(meta.speaker_notes_style)
    if meta.speaker_notes_style then
      -- file handler for css file
      local sh = io.open(fpath)
      if not sh then
        io.stderr:write("Cannot open file " .. fpath .. ".. Skipping adding styles\n")
      else
        -- read all of the contents
        local styles = sh:read("a")
        sh:close()
        -- creating the raw block
        local rb_str = "<style>" .. "\n\n" .. styles .. "\n\n" .. "</style>"
        local raw_block = pandoc.RawBlock('html', rb_str)
        -- inserting the style raw blocks to each notes div
        return doc:walk(add_speaker_style(raw_block))
      end
    end
  end
end
  