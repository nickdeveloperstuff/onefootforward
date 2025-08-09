defmodule SuperdupernovaWeb.WidgetsIndexLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <.lego_grid>
          <!-- Header Section - Cleaner and More Concise -->
          <div class="widget-12x1">
            <h1 class="text-4xl font-bold mb-1">Superdupernova Widget Library</h1>
            <p class="text-base text-base-content/70">
              70+ Phoenix LiveView widgets • DaisyUI powered • Lego-brick UI system
            </p>
          </div>
          
          <!-- Quick Stats Bar -->
          <div class="widget-12x1">
            <div class="flex gap-4 p-4 bg-base-200 rounded-lg">
              <div class="flex items-center gap-2">
                <span class="text-2xl font-bold">70+</span>
                <span class="text-sm">Widgets</span>
              </div>
              <div class="divider divider-horizontal"></div>
              <div class="flex items-center gap-2">
                <span class="text-2xl font-bold">4</span>
                <span class="text-sm">Categories</span>
              </div>
              <div class="divider divider-horizontal"></div>
              <div class="flex items-center gap-2">
                <span class="text-2xl font-bold">17</span>
                <span class="text-sm">Test Pages</span>
              </div>
              <div class="divider divider-horizontal"></div>
              <div class="flex items-center gap-2">
                <span class="text-2xl font-bold">10+</span>
                <span class="text-sm">Grid Sizes</span>
              </div>
            </div>
          </div>
          
          <!-- Widget Categories Grid - More Prominent -->
          <.card title="Widget Categories" size="12x4">
            <div class="grid grid-cols-4 gap-4">
              <div class="text-center p-4 bg-base-100 rounded-lg border-2 border-neutral">
                <h3 class="font-bold text-lg mb-2">Layout</h3>
                <.badge variant="neutral" size="lg">7 widgets</.badge>
                <p class="text-xs mt-2 mb-3">Container, Grid, Drawer, Spacer</p>
                <.link navigate="/layout-test" class="btn btn-sm btn-neutral w-full">
                  View Demo →
                </.link>
              </div>
              
              <div class="text-center p-4 bg-base-100 rounded-lg border-2 border-info">
                <h3 class="font-bold text-lg mb-2">Display</h3>
                <.badge variant="info" size="lg">31 widgets</.badge>
                <p class="text-xs mt-2 mb-3">Card, Alert, Badge, Table, Progress</p>
                <.link navigate="/display-test" class="btn btn-sm btn-info w-full">
                  View Demo →
                </.link>
              </div>
              
              <div class="text-center p-4 bg-base-100 rounded-lg border-2 border-success">
                <h3 class="font-bold text-lg mb-2">Action</h3>
                <.badge variant="success" size="lg">8 widgets</.badge>
                <p class="text-xs mt-2 mb-3">Button, Modal, Dropdown, Theme</p>
                <.link navigate="/action-test" class="btn btn-sm btn-success w-full">
                  View Demo →
                </.link>
              </div>
              
              <div class="text-center p-4 bg-base-100 rounded-lg border-2 border-warning">
                <h3 class="font-bold text-lg mb-2">Form</h3>
                <.badge variant="warning" size="lg">18 widgets</.badge>
                <p class="text-xs mt-2 mb-3">Input, Select, Checkbox, Toggle</p>
                <.link navigate="/form-test" class="btn btn-sm btn-warning w-full">
                  View Demo →
                </.link>
              </div>
            </div>
          </.card>
          
          <!-- Quick Navigation to Test Pages -->
          <.card title="Test Page Navigator" size="6x4">
            <div class="grid grid-cols-2 gap-2">
              <.link navigate="/tabs-test" class="btn btn-sm btn-ghost">Tabs Test</.link>
              <.link navigate="/avatar-test" class="btn btn-sm btn-ghost">Avatar Test</.link>
              <.link navigate="/timeline-test" class="btn btn-sm btn-ghost">Timeline Test</.link>
              <.link navigate="/carousel-test" class="btn btn-sm btn-ghost">Carousel Test</.link>
              <.link navigate="/calendar-test" class="btn btn-sm btn-ghost">Calendar Test</.link>
              <.link navigate="/kbd-test" class="btn btn-sm btn-ghost">Keyboard Test</.link>
              <.link navigate="/chat-test" class="btn btn-sm btn-ghost">Chat Test</.link>
              <.link navigate="/rating-test" class="btn btn-sm btn-ghost">Rating Test</.link>
              <.link navigate="/breadcrumbs-test" class="btn btn-sm btn-ghost">Breadcrumbs</.link>
              <.link navigate="/link-test" class="btn btn-sm btn-ghost">Link Test</.link>
              <.link navigate="/navigation-test" class="btn btn-sm btn-ghost">Navigation</.link>
              <.link navigate="/phase5-test" class="btn btn-sm btn-ghost">Phase 5</.link>
              <.link navigate="/phase6-test" class="btn btn-sm btn-ghost">Phase 6</.link>
            </div>
          </.card>
          
          <!-- Theme Colors Preview -->
          <.card title="Theme Colors" size="6x4">
            <div class="space-y-3">
              <div class="text-sm font-semibold mb-2">Available Themes: Light & Dark</div>
              <div class="grid grid-cols-4 gap-2">
                <div class="text-center">
                  <div class="w-full h-12 bg-primary rounded mb-1"></div>
                  <.badge variant="primary" size="sm">Primary</.badge>
                </div>
                <div class="text-center">
                  <div class="w-full h-12 bg-secondary rounded mb-1"></div>
                  <.badge variant="secondary" size="sm">Secondary</.badge>
                </div>
                <div class="text-center">
                  <div class="w-full h-12 bg-accent rounded mb-1"></div>
                  <.badge variant="accent" size="sm">Accent</.badge>
                </div>
                <div class="text-center">
                  <div class="w-full h-12 bg-neutral rounded mb-1"></div>
                  <.badge variant="neutral" size="sm">Neutral</.badge>
                </div>
                <div class="text-center">
                  <div class="w-full h-12 bg-info rounded mb-1"></div>
                  <.badge variant="info" size="sm">Info</.badge>
                </div>
                <div class="text-center">
                  <div class="w-full h-12 bg-success rounded mb-1"></div>
                  <.badge variant="success" size="sm">Success</.badge>
                </div>
                <div class="text-center">
                  <div class="w-full h-12 bg-warning rounded mb-1"></div>
                  <.badge variant="warning" size="sm">Warning</.badge>
                </div>
                <div class="text-center">
                  <div class="w-full h-12 bg-error rounded mb-1"></div>
                  <.badge variant="error" size="sm">Error</.badge>
                </div>
              </div>
            </div>
          </.card>
          
          <!-- Design System Overview - Compact -->
          <.card title="Design System Quick Reference" size="12x4">
            <div class="grid grid-cols-4 gap-4" id="design-tokens" phx-hook="DesignTokens">
              <!-- Spacing -->
              <div>
                <p class="font-semibold text-sm mb-2">Spacing (4pt System)</p>
                <div class="text-xs space-y-1">
                  <div>unit: <span class="font-mono" data-token="--lego-unit">0.25rem</span></div>
                  <div>unit-2: <span class="font-mono" data-token="--lego-unit-2">0.5rem</span></div>
                  <div>unit-4: <span class="font-mono" data-token="--lego-unit-4">1rem</span></div>
                  <div>unit-8: <span class="font-mono" data-token="--lego-unit-8">2rem</span></div>
                </div>
              </div>
              
              <!-- Border System -->
              <div>
                <p class="font-semibold text-sm mb-2">Borders & Radius</p>
                <div class="text-xs space-y-1">
                  <div>Width: <span class="font-mono" data-token="--border-width">2px</span></div>
                  <div>Color: <span class="font-mono" data-token="--border-color">black</span></div>
                  <div>Radius sm: <span class="font-mono" data-token="--radius-sm">0.125rem</span></div>
                  <div>Radius lg: <span class="font-mono" data-token="--radius-lg">0.5rem</span></div>
                </div>
              </div>
              
              <!-- Shadows -->
              <div>
                <p class="font-semibold text-sm mb-2">Shadow Elevation</p>
                <div class="flex gap-2">
                  <div class="w-8 h-8 bg-white border rounded" style="box-shadow: var(--shadow-sm);" title="sm"></div>
                  <div class="w-8 h-8 bg-white border rounded" style="box-shadow: var(--shadow-md);" title="md"></div>
                  <div class="w-8 h-8 bg-white border rounded" style="box-shadow: var(--shadow-lg);" title="lg"></div>
                  <div class="w-8 h-8 bg-white border rounded" style="box-shadow: var(--shadow-neo);" title="neo"></div>
                </div>
              </div>
              
              <!-- Typography Basics -->
              <div>
                <p class="font-semibold text-sm mb-2">Typography</p>
                <div class="text-xs space-y-1">
                  <div>Base: <span class="font-mono" data-token="--font-family-base">system-ui</span></div>
                  <div>Mono: <span class="font-mono" data-token="--font-family-mono">monospace</span></div>
                  <div>Sizes: xs to 3xl</div>
                  <div>Weights: 400, 500, 600, 700</div>
                </div>
              </div>
            </div>
          </.card>
          
          <!-- Typography Details - Collapsible -->
          <details class="widget-12x1 collapse collapse-arrow bg-base-200">
            <summary class="collapse-title text-lg font-medium">
              Typography System Details
            </summary>
            <div class="collapse-content">
              <div class="grid grid-cols-2 gap-4">
                <!-- Text Sizes -->
                <div>
                  <p class="font-semibold text-sm mb-2">Text Sizes with Examples</p>
                  <div class="space-y-1">
                    <div class="flex items-baseline gap-2">
                      <span class="text-xs w-12">xs:</span>
                      <span class="font-mono text-xs" data-token="--text-xs">0.75rem</span>
                      <span style="font-size: var(--text-xs);">Sample Text</span>
                    </div>
                    <div class="flex items-baseline gap-2">
                      <span class="text-xs w-12">sm:</span>
                      <span class="font-mono text-xs" data-token="--text-sm">0.875rem</span>
                      <span style="font-size: var(--text-sm);">Sample Text</span>
                    </div>
                    <div class="flex items-baseline gap-2">
                      <span class="text-xs w-12">base:</span>
                      <span class="font-mono text-xs" data-token="--text-base">1rem</span>
                      <span style="font-size: var(--text-base);">Sample Text</span>
                    </div>
                    <div class="flex items-baseline gap-2">
                      <span class="text-xs w-12">lg:</span>
                      <span class="font-mono text-xs" data-token="--text-lg">1.125rem</span>
                      <span style="font-size: var(--text-lg);">Sample Text</span>
                    </div>
                    <div class="flex items-baseline gap-2">
                      <span class="text-xs w-12">xl:</span>
                      <span class="font-mono text-xs" data-token="--text-xl">1.25rem</span>
                      <span style="font-size: var(--text-xl);">Sample</span>
                    </div>
                    <div class="flex items-baseline gap-2">
                      <span class="text-xs w-12">2xl:</span>
                      <span class="font-mono text-xs" data-token="--text-2xl">1.5rem</span>
                      <span style="font-size: var(--text-2xl);">Sample</span>
                    </div>
                    <div class="flex items-baseline gap-2">
                      <span class="text-xs w-12">3xl:</span>
                      <span class="font-mono text-xs" data-token="--text-3xl">1.875rem</span>
                      <span style="font-size: var(--text-3xl);">Big</span>
                    </div>
                  </div>
                </div>
                
                <!-- Font Weights and Line Heights -->
                <div>
                  <p class="font-semibold text-sm mb-2">Weights & Line Heights</p>
                  <div class="mb-3">
                    <p class="text-xs text-gray-600 mb-1">Font Weights:</p>
                    <div class="grid grid-cols-2 gap-1 text-sm">
                      <div>
                        <span style="font-weight: var(--font-weight-normal);">Normal</span>
                        <span class="font-mono text-xs ml-1" data-token="--font-weight-normal">400</span>
                      </div>
                      <div>
                        <span style="font-weight: var(--font-weight-medium);">Medium</span>
                        <span class="font-mono text-xs ml-1" data-token="--font-weight-medium">500</span>
                      </div>
                      <div>
                        <span style="font-weight: var(--font-weight-semibold);">Semibold</span>
                        <span class="font-mono text-xs ml-1" data-token="--font-weight-semibold">600</span>
                      </div>
                      <div>
                        <span style="font-weight: var(--font-weight-bold);">Bold</span>
                        <span class="font-mono text-xs ml-1" data-token="--font-weight-bold">700</span>
                      </div>
                    </div>
                  </div>
                  
                  <div>
                    <p class="text-xs text-gray-600 mb-1">Line Heights:</p>
                    <div class="space-y-1 text-xs">
                      <div style="line-height: var(--line-height-tight);">
                        <span class="font-mono" data-token="--line-height-tight">1.25</span> - Tight
                      </div>
                      <div style="line-height: var(--line-height-normal);">
                        <span class="font-mono" data-token="--line-height-normal">1.5</span> - Normal
                      </div>
                      <div style="line-height: var(--line-height-relaxed);">
                        <span class="font-mono" data-token="--line-height-relaxed">1.75</span> - Relaxed
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </details>
          
          <!-- All Widgets Directory - Full Width -->
          <.card title="Complete Widget Directory" size="12x6">
            <.widget_table 
              data={@widgets}
              columns={[
                %{key: :name, label: "Widget Name"},
                %{key: :category, label: "Category"},
                %{key: :description, label: "Description"},
                %{key: :phase, label: "Phase"},
                %{key: :demo_page, label: "Demo Page"}
              ]}
            />
          </.card>
        </.lego_grid>
      </.lego_container>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    widgets = [
      %{name: "lego_container", category: "Layout", demo_page: "/layout-test", description: "Container component", phase: 1},
      %{name: "lego_grid", category: "Layout", demo_page: "/layout-test", description: "12-column grid system", phase: 1},
      %{name: "drawer", category: "Layout", demo_page: "/layout-test", description: "Slide-out navigation drawer", phase: 1},
      %{name: "spacer", category: "Layout", demo_page: "/layout-test", description: "Spacing utility", phase: 1},
      %{name: "divider", category: "Layout", demo_page: "/layout-test", description: "Content separator", phase: 1},
      %{name: "card", category: "Display", demo_page: "/display-test", description: "Content container", phase: 2},
      %{name: "alert", category: "Display", demo_page: "/display-test", description: "Notification message", phase: 2},
      %{name: "badge", category: "Display", demo_page: "/display-test", description: "Status indicator", phase: 2},
      %{name: "table", category: "Display", demo_page: "/display-test", description: "Data table", phase: 2},
      %{name: "progress", category: "Display", demo_page: "/display-test", description: "Progress bar", phase: 2},
      %{name: "stat", category: "Display", demo_page: "/display-test", description: "Statistics display", phase: 2},
      %{name: "steps", category: "Display", demo_page: "/display-test", description: "Process steps", phase: 2},
      %{name: "loading", category: "Display", demo_page: "/display-test", description: "Loading spinner", phase: 2},
      %{name: "skeleton", category: "Display", demo_page: "/display-test", description: "Content placeholder", phase: 2},
      %{name: "avatar", category: "Display", demo_page: "/avatar-test", description: "User profile image", phase: 1},
      %{name: "timeline", category: "Display", demo_page: "/timeline-test", description: "Event timeline", phase: 3},
      %{name: "carousel", category: "Display", demo_page: "/carousel-test", description: "Image slider", phase: 3},
      %{name: "calendar", category: "Display", demo_page: "/calendar-test", description: "Date picker", phase: 4},
      %{name: "kbd", category: "Display", demo_page: "/kbd-test", description: "Keyboard key display", phase: 4},
      %{name: "chat_bubble", category: "Display", demo_page: "/chat-test", description: "Chat message", phase: 3},
      %{name: "rating", category: "Display", demo_page: "/rating-test", description: "Star rating", phase: 3},
      %{name: "breadcrumbs", category: "Display", demo_page: "/breadcrumbs-test", description: "Navigation path", phase: 2},
      %{name: "link", category: "Display", demo_page: "/link-test", description: "Styled hyperlink", phase: 2},
      %{name: "radial_progress", category: "Display", demo_page: "/phase6-test", description: "Circular progress", phase: 6},
      %{name: "status_indicator", category: "Display", demo_page: "/phase6-test", description: "Status dot", phase: 6},
      %{name: "tooltip", category: "Display", demo_page: "/display-test", description: "Hover tooltip", phase: 1},
      %{name: "toast", category: "Display", demo_page: "/display-test", description: "Toast notification", phase: 1},
      %{name: "pagination", category: "Display", demo_page: "/display-test", description: "Page navigation", phase: 1},
      %{name: "widget_button", category: "Action", demo_page: "/action-test", description: "Button component", phase: 2},
      %{name: "icon_button", category: "Action", demo_page: "/action-test", description: "Icon-only button", phase: 2},
      %{name: "button_group", category: "Action", demo_page: "/action-test", description: "Grouped buttons", phase: 2},
      %{name: "modal", category: "Action", demo_page: "/action-test", description: "Modal dialog", phase: 2},
      %{name: "dropdown", category: "Action", demo_page: "/action-test", description: "Dropdown menu", phase: 2},
      %{name: "swap", category: "Action", demo_page: "/action-test", description: "Toggle animation", phase: 2},
      %{name: "theme_controller", category: "Action", demo_page: "/action-test", description: "Theme switcher", phase: 4},
      %{name: "text_input", category: "Form", demo_page: "/form-test", description: "Text field", phase: 2},
      %{name: "email_input", category: "Form", demo_page: "/form-test", description: "Email field", phase: 2},
      %{name: "password_input", category: "Form", demo_page: "/form-test", description: "Password field", phase: 2},
      %{name: "number_input", category: "Form", demo_page: "/form-test", description: "Number field", phase: 2},
      %{name: "textarea", category: "Form", demo_page: "/form-test", description: "Multi-line text", phase: 2},
      %{name: "select_input", category: "Form", demo_page: "/form-test", description: "Dropdown select", phase: 2},
      %{name: "checkbox", category: "Form", demo_page: "/form-test", description: "Checkbox input", phase: 2},
      %{name: "toggle", category: "Form", demo_page: "/form-test", description: "Toggle switch", phase: 2},
      %{name: "radio_group", category: "Form", demo_page: "/form-test", description: "Radio buttons", phase: 2},
      %{name: "file_input", category: "Form", demo_page: "/form-test", description: "File upload", phase: 2},
      %{name: "date_input", category: "Form", demo_page: "/form-test", description: "Date picker", phase: 2},
      %{name: "range_slider", category: "Form", demo_page: "/form-test", description: "Range input", phase: 2},
      %{name: "fieldset", category: "Form", demo_page: "/phase5-test", description: "Form group", phase: 5},
      %{name: "label", category: "Form", demo_page: "/phase5-test", description: "Form label", phase: 5},
      %{name: "filter", category: "Form", demo_page: "/phase5-test", description: "Filter controls", phase: 5},
      %{name: "validator", category: "Form", demo_page: "/phase5-test", description: "Input validator", phase: 5},
      %{name: "tabs", category: "Navigation", demo_page: "/tabs-test", description: "Tab navigation", phase: 1},
      %{name: "accordion", category: "Navigation", demo_page: "/tabs-test", description: "Collapsible panels", phase: 1},
      %{name: "menu", category: "Navigation", demo_page: "/navigation-test", description: "Navigation menu", phase: 2},
      %{name: "navbar", category: "Navigation", demo_page: "/navigation-test", description: "Navigation bar", phase: 2}
    ]
    
    {:ok, assign(socket, widgets: widgets)}
  end


end