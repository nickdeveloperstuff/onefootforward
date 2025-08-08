defmodule SuperdupernovaWeb.KbdTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-2xl font-bold mb-4">Keyboard Display (Kbd) Widget Test - Phase 4</h1>
        
        <.lego_grid>
          <!-- Single Keys -->
          <div class="widget-6x2">
            <h2 class="text-lg font-semibold mb-4">Single Keys</h2>
            <div class="space-y-2">
              <div>Press <.kbd key="Enter" /> to submit</div>
              <div>Press <.kbd key="Escape" /> to cancel</div>
              <div>Press <.kbd key="Space" /> to pause</div>
              <div>Press <.kbd key="Tab" /> to navigate</div>
              <div>Press <.kbd key="Delete" /> to remove</div>
              <div>Press <.kbd key="Backspace" /> to go back</div>
            </div>
          </div>

          <!-- Key Combinations -->
          <div class="widget-6x2">
            <h2 class="text-lg font-semibold mb-4">Key Combinations</h2>
            <div class="space-y-2">
              <div>Copy: <.kbd keys={["Ctrl", "C"]} /></div>
              <div>Paste: <.kbd keys={["Ctrl", "V"]} /></div>
              <div>Undo: <.kbd keys={["Ctrl", "Z"]} /></div>
              <div>Save: <.kbd keys={["Ctrl", "S"]} /></div>
              <div>Select All: <.kbd keys={["Ctrl", "A"]} /></div>
              <div>Find: <.kbd keys={["Ctrl", "F"]} /></div>
            </div>
          </div>

          <!-- Mac Style Keys -->
          <div class="widget-6x2">
            <h2 class="text-lg font-semibold mb-4">Mac Style Keys</h2>
            <div class="space-y-2">
              <div>Command: <.kbd keys={["Cmd", "K"]} /></div>
              <div>Option: <.kbd keys={["Option", "Tab"]} /></div>
              <div>Shift Command: <.kbd keys={["Shift", "Cmd", "P"]} /></div>
              <div>Control Option: <.kbd keys={["Ctrl", "Option", "Delete"]} /></div>
            </div>
          </div>

          <!-- Arrow Keys -->
          <div class="widget-6x2">
            <h2 class="text-lg font-semibold mb-4">Arrow & Navigation Keys</h2>
            <div class="space-y-2">
              <div>Navigate: <.kbd key="Up" /> <.kbd key="Down" /> <.kbd key="Left" /> <.kbd key="Right" /></div>
              <div>Page: <.kbd key="PageUp" /> <.kbd key="PageDown" /></div>
              <div>Jump: <.kbd key="Home" /> <.kbd key="End" /></div>
            </div>
          </div>

          <!-- Different Sizes -->
          <div class="widget-12x2">
            <h2 class="text-lg font-semibold mb-4">Different Sizes</h2>
            <div class="flex gap-4 items-center">
              <.kbd key="XS" size="xs" />
              <.kbd key="SM" size="sm" />
              <.kbd key="MD" size="md" />
              <.kbd key="LG" size="lg" />
              <.kbd keys={["Ctrl", "Alt", "Del"]} size="xs" />
              <.kbd keys={["Ctrl", "Alt", "Del"]} size="sm" />
              <.kbd keys={["Ctrl", "Alt", "Del"]} size="md" />
              <.kbd keys={["Ctrl", "Alt", "Del"]} size="lg" />
            </div>
          </div>

          <!-- Different Themes -->
          <div class="widget-12x2">
            <h2 class="text-lg font-semibold mb-4">Different Themes</h2>
            <div class="flex gap-4">
              <div>
                Default: <.kbd keys={["Ctrl", "C"]} theme="default" />
              </div>
              <div>
                Dark: <.kbd keys={["Ctrl", "V"]} theme="dark" />
              </div>
              <div>
                Light: <.kbd keys={["Ctrl", "X"]} theme="light" />
              </div>
            </div>
          </div>

          <!-- Custom Content with Slot -->
          <div class="widget-6x2">
            <h2 class="text-lg font-semibold mb-4">Custom Content</h2>
            <div class="space-y-2">
              <div>Custom: <.kbd>CUSTOM</.kbd></div>
              <div>Function: <.kbd>F1</.kbd> <.kbd>F2</.kbd> <.kbd>F3</.kbd></div>
              <div>Numbers: <.kbd>1</.kbd> <.kbd>2</.kbd> <.kbd>3</.kbd></div>
            </div>
          </div>

          <!-- Keyboard Shortcuts List -->
          <div class="widget-6x4">
            <h2 class="text-lg font-semibold mb-4">Keyboard Shortcuts List</h2>
            <.kbd_shortcuts 
              title="Editor Shortcuts"
              layout="list"
              shortcuts={[
                {"Open file", ["Ctrl", "O"]},
                {"Save file", ["Ctrl", "S"]},
                {"Save as", ["Ctrl", "Shift", "S"]},
                {"Close file", ["Ctrl", "W"]},
                {"Find", ["Ctrl", "F"]},
                {"Replace", ["Ctrl", "H"]}
              ]}
            />
          </div>

          <!-- Grid Layout Shortcuts -->
          <div class="widget-12x3">
            <h2 class="text-lg font-semibold mb-4">Grid Layout Shortcuts</h2>
            <.kbd_shortcuts 
              title="Navigation Shortcuts"
              layout="grid"
              shortcuts={[
                {"Next Tab", ["Ctrl", "Tab"]},
                {"Previous Tab", ["Ctrl", "Shift", "Tab"]},
                {"New Tab", ["Ctrl", "T"]},
                {"Close Tab", ["Ctrl", "W"]},
                {"Reopen Tab", ["Ctrl", "Shift", "T"]},
                {"Jump to Tab", ["Ctrl", "1-9"]}
              ]}
            />
          </div>

          <!-- Inline Layout Shortcuts -->
          <div class="widget-12x2">
            <h2 class="text-lg font-semibold mb-4">Inline Layout Shortcuts</h2>
            <.kbd_shortcuts 
              layout="inline"
              shortcuts={[
                {"Bold", ["Ctrl", "B"]},
                {"Italic", ["Ctrl", "I"]},
                {"Underline", ["Ctrl", "U"]},
                {"Link", ["Ctrl", "K"]}
              ]}
            />
          </div>
        </.lego_grid>
      </.lego_container>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end