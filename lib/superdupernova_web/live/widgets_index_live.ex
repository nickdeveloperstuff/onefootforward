defmodule SuperdupernovaWeb.WidgetsIndexLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <.lego_grid>
          <!-- Header Section - Full Width -->
          <div class="widget-12x1">
            <h1 class="text-3xl font-bold mb-2">Superdupernova Widget Showcase</h1>
            <p class="text-lg text-base-content/70">
              Comprehensive design system with 70+ widgets built on Phoenix LiveView, DaisyUI, and the Lego-brick UI system
            </p>
          </div>
          
          <!-- Design Tokens Card -->
          <.card title="Design System Tokens" size="6x4">
            <div class="space-y-3">
              <div>
                <p class="font-semibold text-sm mb-2">Theme: Light (default) & Dark</p>
                <div class="flex flex-wrap gap-2">
                  <.badge variant="primary">Primary</.badge>
                  <.badge variant="secondary">Secondary</.badge>
                  <.badge variant="accent">Accent</.badge>
                  <.badge variant="info">Info</.badge>
                  <.badge variant="success">Success</.badge>
                  <.badge variant="warning">Warning</.badge>
                  <.badge variant="error">Error</.badge>
                  <.badge variant="neutral">Neutral</.badge>
                </div>
              </div>
              <div class="grid grid-cols-2 gap-4">
                <div>
                  <p class="font-semibold text-sm mb-1">Border Radius</p>
                  <p class="text-xs">Selector: 0.25rem (4px)</p>
                  <p class="text-xs">Field: 0.25rem (4px)</p>
                  <p class="text-xs">Box: 0.5rem (8px)</p>
                </div>
                <div>
                  <p class="font-semibold text-sm mb-1">Borders & Depth</p>
                  <p class="text-xs">Border Width: 1.5px</p>
                  <p class="text-xs">Depth: 1</p>
                  <p class="text-xs">Noise: 0</p>
                </div>
              </div>
              <div class="grid grid-cols-2 gap-4">
                <div>
                  <p class="font-semibold text-sm mb-1">Grid System</p>
                  <p class="text-xs">Columns: 12</p>
                  <p class="text-xs">Gutter: 1rem (16px)</p>
                  <p class="text-xs">Unit: 0.25rem (4px)</p>
                </div>
                <div>
                  <p class="font-semibold text-sm mb-1">Container</p>
                  <p class="text-xs">Padding X: 0.5rem (px-2)</p>
                  <p class="text-xs">Padding Y: 0.5rem (py-2)</p>
                  <p class="text-xs">Width: 100% (full)</p>
                </div>
              </div>
              <div>
                <p class="font-semibold text-sm mb-1">Typography</p>
                <p class="text-xs">Font Family: System default</p>
                <p class="text-xs">Line Height: Default</p>
                <p class="text-xs">Letter Spacing: Default</p>
              </div>
            </div>
          </.card>
          
          <!-- Stats Card -->
          <.card title="Widget Statistics" size="6x4">
            <div class="grid grid-cols-2 gap-4">
              <.stat title="Total Widgets" value="70+" desc="Components" />
              <.stat title="Categories" value="4" desc="Major groups" />
              <.stat title="Test Pages" value="17" desc="Live demos" />
              <.stat title="Grid Sizes" value="10+" desc="Layout options" />
            </div>
          </.card>
          
          <!-- Category Cards - 4 cards at 3 columns each = 12 total -->
          <div class="widget-3x2">
            <.card title="Layout Widgets" size="12x4">
              <div class="space-y-2">
                <.badge variant="neutral">7 widgets</.badge>
                <p class="text-sm">Container, Grid, Drawer, Spacer, Divider</p>
                <.link navigate="/layout-test" class="btn btn-sm btn-primary w-full">
                  View Layout Demo →
                </.link>
              </div>
            </.card>
          </div>
          
          <div class="widget-3x2">
            <.card title="Display Widgets" size="12x4">
              <div class="space-y-2">
                <.badge variant="info">31 widgets</.badge>
                <p class="text-sm">Card, Alert, Badge, Table, Progress, Avatar...</p>
                <.link navigate="/display-test" class="btn btn-sm btn-primary w-full">
                  View Display Demo →
                </.link>
              </div>
            </.card>
          </div>
          
          <div class="widget-3x2">
            <.card title="Action Widgets" size="12x4">
              <div class="space-y-2">
                <.badge variant="success">8 widgets</.badge>
                <p class="text-sm">Button, Modal, Dropdown, Theme Controller...</p>
                <.link navigate="/action-test" class="btn btn-sm btn-primary w-full">
                  View Action Demo →
                </.link>
              </div>
            </.card>
          </div>
          
          <div class="widget-3x2">
            <.card title="Form Widgets" size="12x4">
              <div class="space-y-2">
                <.badge variant="warning">18 widgets</.badge>
                <p class="text-sm">Input, Select, Checkbox, Toggle, Validator...</p>
                <.link navigate="/form-test" class="btn btn-sm btn-primary w-full">
                  View Form Demo →
                </.link>
              </div>
            </.card>
          </div>
          
          <!-- Comprehensive Widget Table -->
          <div class="widget-12x4">
            <.card title="All Widgets Directory" size="12x4">
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
          </div>
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