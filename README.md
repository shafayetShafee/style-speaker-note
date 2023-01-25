# Style-speaker-note Extension For Quarto

Style the Speaker Notes of the RevealJs slides.

See the [live demo](https://shafayetshafee.github.io/style-speaker-note/example.html)

## Installing

```bash
quarto add shafayetShafee/style-speaker-note
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Using

To style the fonts (i.e. font-family, font-size etc) or other components of Speaker Notes using this filter, write necessary css codes in a CSS file and then attach that file to the quarto file using `speaker_notes_style` YAML option under revealjs format.

And then use the defined class, id etc. in that css file for the texts in the `notes` div using either pandoc div syntax `:::` or span `[]`. A small example is the following,


**minimal_style.css**

~~~
.smaller {
  font-size: 12px;
}
~~~

**minimal_example.qmd**

~~~
---
title: "Changing styles of Speaker notes."
format: 
  revealjs:
    speaker_notes_style: minimal_style.css
engine: knitr
filters:
  - style-speaker-note
---


## A Slide with speaker notes

Press `s` to see the speaker notes.

::: {.notes}

[Notes with smaller font]{.smaller}

and these are in usual size.

:::
~~~

For more detailed example, see next.

## Example

Here is the source code for a minimal example: [example.qmd](example.qmd) and 
the rendered output [example.html](https://shafayetshafee.github.io/style-speaker-note/example.html)