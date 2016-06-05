This minor mode highlights indentation levels using a pair of alternating
faces. Indent widths are dynamically discovered, which means this correctly
highlights in any mode, regardless of indent width, even in languages with
non-uniform indentation such as Haskell. This mode works properly around hard
tabs and mixed indentation, and it behaves well in large buffers.

To install, put this file in your load-path, and require it:

  (require 'highlight-indent-guides)

Then, do M-x highlight-indent-guides-mode to enable it. To enable it
automatically in most programming modes, use the following:

  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

To change the colors used for highlighting, use:

  (set-face-background 'highlight-indent-guides-odd-face "color")
  (set-face-background 'highlight-indent-guides-even-face "color")
