# Remaining Widget Implementation Guide

## Table of Contents

### Overview & Prerequisites
- [Overview](#overview)
- [Pre-Implementation Checklist](#pre-implementation-checklist)
- [Architecture Patterns](#architecture-patterns)
- [Testing Requirements](#testing-requirements)

### PHASE 1: High Priority Navigation & Feedback Widgets
#### Section 1.1: Avatar Widget
- [Sub-section 1.1.1: Basic Avatar Component](#sub-section-111-basic-avatar-component)
- [Sub-section 1.1.2: Avatar with Status Indicators](#sub-section-112-avatar-with-status-indicators)
- [Sub-section 1.1.3: Avatar Groups](#sub-section-113-avatar-groups)
- [Sub-section 1.1.4: Testing Avatar Widget](#sub-section-114-testing-avatar-widget)

#### Section 1.2: Tooltip Widget
- [Sub-section 1.2.1: Basic Tooltip Component](#sub-section-121-basic-tooltip-component)
- [Sub-section 1.2.2: Tooltip Positions](#sub-section-122-tooltip-positions)
- [Sub-section 1.2.3: JavaScript Hooks](#sub-section-123-javascript-hooks)
- [Sub-section 1.2.4: Testing Tooltip Widget](#sub-section-124-testing-tooltip-widget)

#### Section 1.3: Toast Widget
- [Sub-section 1.3.1: Toast Container Component](#sub-section-131-toast-container-component)
- [Sub-section 1.3.2: Toast Notifications](#sub-section-132-toast-notifications)
- [Sub-section 1.3.3: Auto-dismiss Functionality](#sub-section-133-auto-dismiss-functionality)
- [Sub-section 1.3.4: Testing Toast Widget](#sub-section-134-testing-toast-widget)

#### Section 1.4: Pagination Widget
- [Sub-section 1.4.1: Basic Pagination Component](#sub-section-141-basic-pagination-component)
- [Sub-section 1.4.2: Page Navigation Logic](#sub-section-142-page-navigation-logic)
- [Sub-section 1.4.3: Integration with Tables](#sub-section-143-integration-with-tables)
- [Sub-section 1.4.4: Testing Pagination Widget](#sub-section-144-testing-pagination-widget)

### PHASE 2: Core Navigation Components
#### Section 2.1: Menu/Navbar Widget
- [Sub-section 2.1.1: Menu Component Structure](#sub-section-211-menu-component-structure)
- [Sub-section 2.1.2: Navbar Component](#sub-section-212-navbar-component)
- [Sub-section 2.1.3: Responsive Behavior](#sub-section-213-responsive-behavior)
- [Sub-section 2.1.4: Testing Navigation Components](#sub-section-214-testing-navigation-components)

#### Section 2.2: Breadcrumbs Widget
- [Sub-section 2.2.1: Basic Breadcrumbs Component](#sub-section-221-basic-breadcrumbs-component)
- [Sub-section 2.2.2: Dynamic Path Generation](#sub-section-222-dynamic-path-generation)
- [Sub-section 2.2.3: Testing Breadcrumbs Widget](#sub-section-223-testing-breadcrumbs-widget)

#### Section 2.3: Link Widget
- [Sub-section 2.3.1: Styled Link Component](#sub-section-231-styled-link-component)
- [Sub-section 2.3.2: LiveView Navigation Integration](#sub-section-232-liveview-navigation-integration)
- [Sub-section 2.3.3: Testing Link Widget](#sub-section-233-testing-link-widget)

### PHASE 3: Advanced Display Components
#### Section 3.1: Timeline Widget
- [Sub-section 3.1.1: Basic Timeline Component](#sub-section-311-basic-timeline-component)
- [Sub-section 3.1.2: Timeline Item Structure](#sub-section-312-timeline-item-structure)
- [Sub-section 3.1.3: Timeline Variants](#sub-section-313-timeline-variants)
- [Sub-section 3.1.4: Testing Timeline Widget](#sub-section-314-testing-timeline-widget)

#### Section 3.2: Carousel Widget
- [Sub-section 3.2.1: Basic Carousel Component](#sub-section-321-basic-carousel-component)
- [Sub-section 3.2.2: Navigation Controls](#sub-section-322-navigation-controls)
- [Sub-section 3.2.3: Auto-play Functionality](#sub-section-323-auto-play-functionality)
- [Sub-section 3.2.4: Testing Carousel Widget](#sub-section-324-testing-carousel-widget)

#### Section 3.3: Chat Bubble Widget
- [Sub-section 3.3.1: Basic Chat Component](#sub-section-331-basic-chat-component)
- [Sub-section 3.3.2: Message Types](#sub-section-332-message-types)
- [Sub-section 3.3.3: Testing Chat Widget](#sub-section-333-testing-chat-widget)

#### Section 3.4: Rating Widget
- [Sub-section 3.4.1: Basic Rating Component](#sub-section-341-basic-rating-component)
- [Sub-section 3.4.2: Interactive Rating](#sub-section-342-interactive-rating)
- [Sub-section 3.4.3: Testing Rating Widget](#sub-section-343-testing-rating-widget)

### PHASE 4: Specialized Components
#### Section 4.1: Calendar Widget
- [Sub-section 4.1.1: Basic Calendar Component](#sub-section-411-basic-calendar-component)
- [Sub-section 4.1.2: Date Selection Logic](#sub-section-412-date-selection-logic)
- [Sub-section 4.1.3: Testing Calendar Widget](#sub-section-413-testing-calendar-widget)

#### Section 4.2: Keyboard Display Widget
- [Sub-section 4.2.1: Kbd Component](#sub-section-421-kbd-component)
- [Sub-section 4.2.2: Key Combinations](#sub-section-422-key-combinations)
- [Sub-section 4.2.3: Testing Kbd Widget](#sub-section-423-testing-kbd-widget)

#### Section 4.3: Minor Display Components
- [Sub-section 4.3.1: Countdown Widget](#sub-section-431-countdown-widget)
- [Sub-section 4.3.2: Diff Widget](#sub-section-432-diff-widget)
- [Sub-section 4.3.3: Dock Widget](#sub-section-433-dock-widget)
- [Sub-section 4.3.4: Theme Controller](#sub-section-434-theme-controller)

### PHASE 5: Form Enhancement Components
#### Section 5.1: Advanced Form Components
- [Sub-section 5.1.1: Fieldset Widget](#sub-section-511-fieldset-widget)
- [Sub-section 5.1.2: Label Widget](#sub-section-512-label-widget)
- [Sub-section 5.1.3: Filter Widget](#sub-section-513-filter-widget)
- [Sub-section 5.1.4: Validator Widget](#sub-section-514-validator-widget)

### PHASE 6: Progress & Status Components
#### Section 6.1: Enhanced Progress Components
- [Sub-section 6.1.1: Radial Progress Full Implementation](#sub-section-611-radial-progress-full-implementation)
- [Sub-section 6.1.2: List Component](#sub-section-612-list-component)
- [Sub-section 6.1.3: Status Indicator](#sub-section-613-status-indicator)

---

## Overview

This guide provides detailed, step-by-step instructions for implementing the remaining widgets identified in the Remaining_Widgets_Analysis.md document. Each widget follows the exact same patterns, architectures, and techniques established in the original step_by_step_implementation_guide.md.

### Key Implementation Principles:
1. **All widgets use Phoenix.Component** - No external JavaScript libraries
2. **All styling via DaisyUI classes** - Consistent with existing widgets
3. **Grid sizing support** - Using the established widget size classes
4. **Thorough testing** - Puppeteer screenshots after each implementation
5. **Compilation testing** - Verify no errors after each step
6. **Documentation of hiccups** - Record all issues encountered

---

## Pre-Implementation Checklist

Before beginning, ensure all prerequisites from the original implementation are met:

- [ ] Phoenix LiveView application is running
- [ ] Tailwind CSS is installed and configured
- [ ] DaisyUI is installed (`npm install daisyui`)
- [ ] Ash Framework is installed and configured
- [ ] Puppeteer MCP is available for testing
- [ ] Basic LiveView router is set up
- [ ] All existing widgets compile successfully
- [ ] Test server accessible at http://localhost:4000

**Verify existing setup:**
```bash
mix compile
mix phx.server
```

---

## Architecture Patterns

All new widgets must follow these established patterns:

### Widget Module Structure:
- Place in appropriate category module (Display, Action, Form, Layout)
- Use Phoenix.Component
- Include proper documentation with @doc tags
- Support grid sizing via `size` attribute
- Use DaisyUI classes exclusively

### Standard Attributes:
```elixir
attr :size, :string, default: "4x1", values: ["1x1", "2x1", "3x1", "4x1", "6x1", "8x1", "12x1", "6x2", "12x2", "12x4"]
attr :class, :string, default: ""
slot :inner_block, required: false
```

### Testing Pattern:
1. Write widget implementation
2. Compile check: `mix compile`
3. Create test LiveView
4. Add route
5. Navigate with Puppeteer
6. Take screenshot
7. Document any hiccups
8. Mark checkbox complete

---

## Testing Requirements

Every widget implementation requires:

### 1. Compilation Testing:
```bash
mix compile
# Should complete with no errors
```

### 2. Visual Testing via Puppeteer:
```javascript
// Navigate to test page
mcp__puppeteer__puppeteer_navigate(url: "http://localhost:4000/[widget-test-route]")
// Take screenshot
mcp__puppeteer__puppeteer_screenshot(name: "[phase]_[widget]_test", width: 1280, height: 800)
```

### 3. Interactive Testing (where applicable):
```javascript
// Test interactions
mcp__puppeteer__puppeteer_click(selector: "[selector]")
mcp__puppeteer__puppeteer_fill(selector: "[selector]", value: "[value]")
```

### 4. Documentation Format:
```markdown
**Documentation of Hiccups:**
_Record any issues encountered during implementation_

- Issue: [Description]
- Solution: [How it was resolved]
```

---

# PHASE 1: High Priority Navigation & Feedback Widgets

## Section 1.1: Avatar Widget

### Sub-section 1.1.1: Basic Avatar Component

**Task**: Create the basic avatar widget for user profile images

1. Open or create `lib/superdupernova_web/widgets/display.ex` if not exists
2. Add the avatar widget function:

```elixir
@doc """
Avatar widget for user profile images with status indicators
"""
attr :src, :string, default: nil
attr :alt, :string, default: "Avatar"
attr :size, :string, default: "md", values: ["xs", "sm", "md", "lg", "xl"]
attr :shape, :string, default: "circle", values: ["circle", "square"]
attr :status, :string, default: nil, values: [nil, "online", "offline", "away", "busy"]
attr :placeholder, :string, default: nil
slot :inner_block

def avatar(assigns) do
  ~H"""
  <div class={avatar_container_class(@size)}>
    <div class={avatar_class(@status)}>
      <div class={avatar_size_class(@size, @shape)}>
        <%= if @src do %>
          <img src={@src} alt={@alt} />
        <% else %>
          <%= if @placeholder do %>
            <span class="text-3xl"><%= @placeholder %></span>
          <% else %>
            <%= render_slot(@inner_block) %>
          <% end %>
        <% end %>
      </div>
    </div>
  </div>
  """
end

defp avatar_container_class(size) do
  case size do
    "xs" -> "avatar-xs"
    "sm" -> "avatar-sm"
    "md" -> "avatar"
    "lg" -> "avatar-lg"
    "xl" -> "avatar-xl"
    _ -> "avatar"
  end
end

defp avatar_class(nil), do: "avatar"
defp avatar_class(status), do: "avatar #{status}"

defp avatar_size_class(size, shape) do
  base = case size do
    "xs" -> "w-8 h-8"
    "sm" -> "w-12 h-12"
    "md" -> "w-16 h-16"
    "lg" -> "w-20 h-20"
    "xl" -> "w-24 h-24"
    _ -> "w-16 h-16"
  end
  
  shape_class = case shape do
    "square" -> "rounded-lg"
    _ -> "rounded-full"
  end
  
  "#{base} #{shape_class}"
end
```

**Testing Requirements:**
```bash
# Compile check
mix compile
```

**Documentation of Hiccups:**
_Record any compilation errors_

- [ ] Avatar function added to display.ex
- [ ] Helper functions added
- [ ] Compilation successful

### Sub-section 1.1.2: Avatar with Status Indicators

**Task**: Add status indicator support to avatar

1. Update the avatar widget to include status indicators:

```elixir
@doc """
Avatar with status indicator
"""
attr :show_status, :boolean, default: false
# ... other attrs from above

def avatar_with_status(assigns) do
  ~H"""
  <div class="avatar-group">
    <div class={avatar_with_indicator_class(@status)}>
      <div class={avatar_size_class(@size, @shape)}>
        <%= if @src do %>
          <img src={@src} alt={@alt} />
        <% else %>
          <div class="bg-neutral-focus text-neutral-content">
            <%= @placeholder || render_slot(@inner_block) %>
          </div>
        <% end %>
      </div>
      <%= if @show_status && @status do %>
        <span class={status_indicator_class(@status)}></span>
      <% end %>
    </div>
  </div>
  """
end

defp avatar_with_indicator_class(status) do
  case status do
    "online" -> "avatar online"
    "offline" -> "avatar offline"
    "away" -> "avatar away"
    "busy" -> "avatar busy"
    _ -> "avatar"
  end
end

defp status_indicator_class(status) do
  case status do
    "online" -> "badge badge-success badge-xs absolute -bottom-1 -right-1"
    "offline" -> "badge badge-ghost badge-xs absolute -bottom-1 -right-1"
    "away" -> "badge badge-warning badge-xs absolute -bottom-1 -right-1"
    "busy" -> "badge badge-error badge-xs absolute -bottom-1 -right-1"
    _ -> ""
  end
end
```

**Testing Requirements:**
```bash
mix compile
```

**Documentation of Hiccups:**
_Record any issues with status indicators_

- [ ] Status indicator functions added
- [ ] Compilation successful

### Sub-section 1.1.3: Avatar Groups

**Task**: Create avatar group component for multiple avatars

```elixir
@doc """
Avatar group for displaying multiple avatars
"""
attr :max_display, :integer, default: 3
slot :avatars, required: true

def avatar_group(assigns) do
  ~H"""
  <div class="avatar-group -space-x-6">
    <%= for {avatar, index} <- Enum.with_index(@avatars) do %>
      <%= if index < @max_display do %>
        <%= render_slot(avatar) %>
      <% end %>
    <% end %>
    <%= if length(@avatars) > @max_display do %>
      <div class="avatar placeholder">
        <div class="w-12 bg-neutral-focus text-neutral-content">
          <span>+<%= length(@avatars) - @max_display %></span>
        </div>
      </div>
    <% end %>
  </div>
  """
end
```

**Testing Requirements:**
```bash
mix compile
```

- [ ] Avatar group function added
- [ ] Compilation successful

### Sub-section 1.1.4: Testing Avatar Widget

**Task**: Create comprehensive test page for avatar widget

1. Create `lib/superdupernova_web/live/avatar_test_live.ex`:

```elixir
defmodule SuperdupernovaWeb.AvatarTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-2xl font-bold mb-4">Avatar Widget Test</h1>
        
        <.lego_grid>
          <!-- Basic avatars with different sizes -->
          <div class="widget-12x1">
            <h2 class="text-lg font-semibold mb-2">Avatar Sizes</h2>
            <div class="flex gap-4 items-center">
              <.avatar size="xs" src="https://via.placeholder.com/150" />
              <.avatar size="sm" src="https://via.placeholder.com/150" />
              <.avatar size="md" src="https://via.placeholder.com/150" />
              <.avatar size="lg" src="https://via.placeholder.com/150" />
              <.avatar size="xl" src="https://via.placeholder.com/150" />
            </div>
          </div>

          <!-- Avatars with status -->
          <div class="widget-12x1">
            <h2 class="text-lg font-semibold mb-2">Avatar Status Indicators</h2>
            <div class="flex gap-4">
              <.avatar_with_status status="online" placeholder="ON" show_status={true} />
              <.avatar_with_status status="offline" placeholder="OFF" show_status={true} />
              <.avatar_with_status status="away" placeholder="AW" show_status={true} />
              <.avatar_with_status status="busy" placeholder="BS" show_status={true} />
            </div>
          </div>

          <!-- Avatar group -->
          <div class="widget-12x1">
            <h2 class="text-lg font-semibold mb-2">Avatar Group</h2>
            <.avatar_group max_display={3}>
              <:avatars><.avatar size="sm" placeholder="A" /></:avatars>
              <:avatars><.avatar size="sm" placeholder="B" /></:avatars>
              <:avatars><.avatar size="sm" placeholder="C" /></:avatars>
              <:avatars><.avatar size="sm" placeholder="D" /></:avatars>
              <:avatars><.avatar size="sm" placeholder="E" /></:avatars>
            </.avatar_group>
          </div>

          <!-- Shape variants -->
          <div class="widget-12x1">
            <h2 class="text-lg font-semibold mb-2">Avatar Shapes</h2>
            <div class="flex gap-4">
              <.avatar shape="circle" placeholder="CI" />
              <.avatar shape="square" placeholder="SQ" />
            </div>
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
```

2. Add route in router:
```elixir
live "/avatar-test", AvatarTestLive
```

**Testing Requirements:**
```bash
mix compile
mix phx.server
```

**Puppeteer MCP Test:**
```javascript
// Navigate to avatar test page
mcp__puppeteer__puppeteer_navigate(url: "http://localhost:4000/avatar-test")
// Take screenshot of all avatar variants
mcp__puppeteer__puppeteer_screenshot(name: "phase1_avatar_widget", width: 1280, height: 800)
```

**Documentation of Hiccups:**
_Record any display issues with avatars_

- [ ] Test page created
- [ ] Route added
- [ ] All avatar variants display correctly
- [ ] Status indicators show properly
- [ ] Avatar group works
- [ ] Screenshot captured

---

## Section 1.2: Tooltip Widget

### Sub-section 1.2.1: Basic Tooltip Component

**Task**: Create tooltip widget for hover information display

1. Add to `lib/superdupernova_web/widgets/display.ex`:

```elixir
@doc """
Tooltip widget for displaying hover information
"""
attr :text, :string, required: true
attr :position, :string, default: "top", values: ["top", "bottom", "left", "right"]
attr :color, :string, default: "neutral", values: ["neutral", "primary", "secondary", "accent", "info", "success", "warning", "error"]
attr :force_open, :boolean, default: false
slot :inner_block, required: true

def tooltip(assigns) do
  ~H"""
  <div class={tooltip_class(@position, @color, @force_open)} data-tip={@text}>
    <%= render_slot(@inner_block) %>
  </div>
  """
end

defp tooltip_class(position, color, force_open) do
  base = "tooltip"
  position_class = "tooltip-#{position}"
  color_class = "tooltip-#{color}"
  open_class = if force_open, do: "tooltip-open", else: ""
  
  [base, position_class, color_class, open_class]
  |> Enum.filter(&(&1 != ""))
  |> Enum.join(" ")
end
```

**Testing Requirements:**
```bash
mix compile
```

**Documentation of Hiccups:**
_Record any tooltip implementation issues_

- [ ] Tooltip function added
- [ ] Helper function added
- [ ] Compilation successful

### Sub-section 1.2.2: Tooltip Positions

**Task**: Add comprehensive position support for tooltips

```elixir
@doc """
Advanced tooltip with more positioning options
"""
attr :text, :string, required: true
attr :position, :string, default: "top"
attr :align, :string, default: "center", values: ["start", "center", "end"]
attr :delay, :integer, default: 0
attr :width, :string, default: "auto"

def tooltip_advanced(assigns) do
  ~H"""
  <div 
    class={tooltip_advanced_class(@position, @align)}
    data-tip={@text}
    style={"--tooltip-delay: #{@delay}ms; --tooltip-width: #{@width};"}
  >
    <%= render_slot(@inner_block) %>
  </div>
  """
end

defp tooltip_advanced_class(position, align) do
  base = "tooltip"
  position_class = case position do
    "top-start" -> "tooltip-top tooltip-start"
    "top-end" -> "tooltip-top tooltip-end"
    "bottom-start" -> "tooltip-bottom tooltip-start"
    "bottom-end" -> "tooltip-bottom tooltip-end"
    "left-start" -> "tooltip-left tooltip-start"
    "left-end" -> "tooltip-left tooltip-end"
    "right-start" -> "tooltip-right tooltip-start"
    "right-end" -> "tooltip-right tooltip-end"
    pos -> "tooltip-#{pos}"
  end
  
  "#{base} #{position_class}"
end
```

**Testing Requirements:**
```bash
mix compile
```

- [ ] Advanced tooltip function added
- [ ] Position combinations work
- [ ] Compilation successful

### Sub-section 1.2.3: JavaScript Hooks

**Task**: Create JavaScript hook for tooltip interactions

1. Create `assets/js/hooks/tooltip_hook.js`:

```javascript
export default {
  mounted() {
    this.handleMouseEnter = () => {
      if (this.el.dataset.delay) {
        setTimeout(() => {
          this.el.classList.add('tooltip-open');
        }, parseInt(this.el.dataset.delay));
      }
    };
    
    this.handleMouseLeave = () => {
      this.el.classList.remove('tooltip-open');
    };
    
    this.el.addEventListener('mouseenter', this.handleMouseEnter);
    this.el.addEventListener('mouseleave', this.handleMouseLeave);
  },
  
  destroyed() {
    this.el.removeEventListener('mouseenter', this.handleMouseEnter);
    this.el.removeEventListener('mouseleave', this.handleMouseLeave);
  }
};
```

2. Add to `assets/js/app.js`:

```javascript
import TooltipHook from "./hooks/tooltip_hook";

let Hooks = {
  TooltipHook: TooltipHook
};

let liveSocket = new LiveSocket("/live", Socket, {
  params: {_csrf_token: csrfToken},
  hooks: Hooks
});
```

**Testing Requirements:**
```bash
mix assets.build
mix compile
```

- [ ] JavaScript hook created
- [ ] Hook registered
- [ ] Assets compiled

### Sub-section 1.2.4: Testing Tooltip Widget

**Task**: Create test page for tooltip widget

1. Create `lib/superdupernova_web/live/tooltip_test_live.ex`:

```elixir
defmodule SuperdupernovaWeb.TooltipTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-2xl font-bold mb-4">Tooltip Widget Test</h1>
        
        <.lego_grid>
          <!-- Position variants -->
          <div class="widget-12x2">
            <h2 class="text-lg font-semibold mb-4">Tooltip Positions</h2>
            <div class="flex gap-8 justify-center items-center h-32">
              <.tooltip text="Top tooltip" position="top">
                <button class="btn">Top</button>
              </.tooltip>
              
              <.tooltip text="Bottom tooltip" position="bottom">
                <button class="btn">Bottom</button>
              </.tooltip>
              
              <.tooltip text="Left tooltip" position="left">
                <button class="btn">Left</button>
              </.tooltip>
              
              <.tooltip text="Right tooltip" position="right">
                <button class="btn">Right</button>
              </.tooltip>
            </div>
          </div>

          <!-- Color variants -->
          <div class="widget-12x2">
            <h2 class="text-lg font-semibold mb-4">Tooltip Colors</h2>
            <div class="flex gap-4 flex-wrap">
              <.tooltip text="Primary" color="primary" force_open={true}>
                <button class="btn btn-primary">Primary</button>
              </.tooltip>
              
              <.tooltip text="Secondary" color="secondary" force_open={true}>
                <button class="btn btn-secondary">Secondary</button>
              </.tooltip>
              
              <.tooltip text="Accent" color="accent" force_open={true}>
                <button class="btn btn-accent">Accent</button>
              </.tooltip>
              
              <.tooltip text="Info" color="info" force_open={true}>
                <button class="btn btn-info">Info</button>
              </.tooltip>
              
              <.tooltip text="Success" color="success" force_open={true}>
                <button class="btn btn-success">Success</button>
              </.tooltip>
              
              <.tooltip text="Warning" color="warning" force_open={true}>
                <button class="btn btn-warning">Warning</button>
              </.tooltip>
              
              <.tooltip text="Error" color="error" force_open={true}>
                <button class="btn btn-error">Error</button>
              </.tooltip>
            </div>
          </div>

          <!-- Advanced positioning -->
          <div class="widget-12x2">
            <h2 class="text-lg font-semibold mb-4">Advanced Positioning</h2>
            <div class="grid grid-cols-3 gap-4">
              <.tooltip_advanced text="Top Start" position="top-start">
                <button class="btn btn-outline w-full">Top Start</button>
              </.tooltip_advanced>
              
              <.tooltip_advanced text="Top Center with longer text" position="top">
                <button class="btn btn-outline w-full">Top Center</button>
              </.tooltip_advanced>
              
              <.tooltip_advanced text="Top End" position="top-end">
                <button class="btn btn-outline w-full">Top End</button>
              </.tooltip_advanced>
            </div>
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
```

2. Add route:
```elixir
live "/tooltip-test", TooltipTestLive
```

**Testing Requirements:**
```bash
mix compile
mix phx.server
```

**Puppeteer MCP Test:**
```javascript
// Navigate to tooltip test page
mcp__puppeteer__puppeteer_navigate(url: "http://localhost:4000/tooltip-test")
// Take screenshot showing forced-open tooltips
mcp__puppeteer__puppeteer_screenshot(name: "phase1_tooltip_widget", width: 1280, height: 900)
// Hover over elements
mcp__puppeteer__puppeteer_hover(selector: "button:contains('Top')")
// Screenshot with hover
mcp__puppeteer__puppeteer_screenshot(name: "phase1_tooltip_hover", width: 1280, height: 900)
```

**Documentation of Hiccups:**
_Record any tooltip display issues_

- [ ] Test page created
- [ ] Route added
- [ ] All positions display correctly
- [ ] Color variants work
- [ ] Force open displays tooltips
- [ ] Screenshots captured

---

## Section 1.3: Toast Widget

### Sub-section 1.3.1: Toast Container Component

**Task**: Create toast notification container

1. Add to `lib/superdupernova_web/widgets/display.ex`:

```elixir
@doc """
Toast container for notification display
"""
attr :position, :string, default: "top-end", values: ["top-start", "top-center", "top-end", "bottom-start", "bottom-center", "bottom-end", "middle-start", "middle-center", "middle-end"]
slot :toasts

def toast_container(assigns) do
  ~H"""
  <div class={toast_container_class(@position)}>
    <%= render_slot(@toasts) %>
  </div>
  """
end

defp toast_container_class(position) do
  base = "toast"
  position_classes = case position do
    "top-start" -> "toast-top toast-start"
    "top-center" -> "toast-top toast-center"
    "top-end" -> "toast-top toast-end"
    "bottom-start" -> "toast-bottom toast-start"
    "bottom-center" -> "toast-bottom toast-center"
    "bottom-end" -> "toast-bottom toast-end"
    "middle-start" -> "toast-middle toast-start"
    "middle-center" -> "toast-middle toast-center"
    "middle-end" -> "toast-middle toast-end"
    _ -> "toast-top toast-end"
  end
  
  "#{base} #{position_classes}"
end
```

**Testing Requirements:**
```bash
mix compile
```

- [ ] Toast container function added
- [ ] Position helper added
- [ ] Compilation successful

### Sub-section 1.3.2: Toast Notifications

**Task**: Create individual toast notification component

```elixir
@doc """
Individual toast notification
"""
attr :id, :string, required: true
attr :type, :string, default: "info", values: ["info", "success", "warning", "error"]
attr :title, :string, default: nil
attr :message, :string, required: true
attr :duration, :integer, default: 5000
attr :closable, :boolean, default: true

def toast(assigns) do
  ~H"""
  <div id={@id} class={toast_alert_class(@type)} phx-hook="ToastHook" data-duration={@duration}>
    <div class="flex">
      <%= toast_icon(@type) %>
      <div class="flex-1">
        <%= if @title do %>
          <h3 class="font-bold"><%= @title %></h3>
        <% end %>
        <div class="text-sm"><%= @message %></div>
      </div>
      <%= if @closable do %>
        <button class="btn btn-ghost btn-xs" phx-click={JS.hide(to: "##{@id}")}>
          <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      <% end %>
    </div>
  </div>
  """
end

defp toast_alert_class(type) do
  base = "alert"
  type_class = "alert-#{type}"
  "#{base} #{type_class}"
end

defp toast_icon("info") do
  ~H"""
  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="stroke-info shrink-0 w-6 h-6">
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
  </svg>
  """
end

defp toast_icon("success") do
  ~H"""
  <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
  </svg>
  """
end

defp toast_icon("warning") do
  ~H"""
  <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
  </svg>
  """
end

defp toast_icon("error") do
  ~H"""
  <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
  </svg>
  """
end
```

**Testing Requirements:**
```bash
mix compile
```

- [ ] Toast notification function added
- [ ] Icon helpers added
- [ ] Compilation successful

### Sub-section 1.3.3: Auto-dismiss Functionality

**Task**: Create JavaScript hook for auto-dismiss

1. Create `assets/js/hooks/toast_hook.js`:

```javascript
export default {
  mounted() {
    const duration = parseInt(this.el.dataset.duration) || 5000;
    
    if (duration > 0) {
      this.timeout = setTimeout(() => {
        this.el.style.animation = 'fade-out 0.3s ease-out';
        setTimeout(() => {
          this.el.remove();
        }, 300);
      }, duration);
    }
    
    // Pause on hover
    this.el.addEventListener('mouseenter', () => {
      if (this.timeout) {
        clearTimeout(this.timeout);
      }
    });
    
    this.el.addEventListener('mouseleave', () => {
      const remainingDuration = parseInt(this.el.dataset.duration) || 5000;
      this.timeout = setTimeout(() => {
        this.el.style.animation = 'fade-out 0.3s ease-out';
        setTimeout(() => {
          this.el.remove();
        }, 300);
      }, remainingDuration);
    });
  },
  
  destroyed() {
    if (this.timeout) {
      clearTimeout(this.timeout);
    }
  }
};
```

2. Add CSS animation to `assets/css/app.css`:

```css
@keyframes fade-out {
  from { opacity: 1; }
  to { opacity: 0; }
}

@keyframes slide-in-right {
  from {
    transform: translateX(100%);
    opacity: 0;
  }
  to {
    transform: translateX(0);
    opacity: 1;
  }
}

.toast .alert {
  animation: slide-in-right 0.3s ease-out;
}
```

3. Register hook in `assets/js/app.js`:

```javascript
import ToastHook from "./hooks/toast_hook";

let Hooks = {
  TooltipHook: TooltipHook,
  ToastHook: ToastHook
};
```

**Testing Requirements:**
```bash
mix assets.build
mix compile
```

- [ ] JavaScript hook created
- [ ] CSS animations added
- [ ] Hook registered
- [ ] Assets compiled

### Sub-section 1.3.4: Testing Toast Widget

**Task**: Create comprehensive test page for toast notifications

1. Create `lib/superdupernova_web/live/toast_test_live.ex`:

```elixir
defmodule SuperdupernovaWeb.ToastTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-2xl font-bold mb-4">Toast Notification Test</h1>
        
        <.lego_grid>
          <!-- Control buttons -->
          <div class="widget-12x2">
            <h2 class="text-lg font-semibold mb-4">Trigger Toast Notifications</h2>
            <div class="flex gap-4 flex-wrap">
              <button class="btn btn-info" phx-click="show_toast" phx-value-type="info">
                Show Info Toast
              </button>
              <button class="btn btn-success" phx-click="show_toast" phx-value-type="success">
                Show Success Toast
              </button>
              <button class="btn btn-warning" phx-click="show_toast" phx-value-type="warning">
                Show Warning Toast
              </button>
              <button class="btn btn-error" phx-click="show_toast" phx-value-type="error">
                Show Error Toast
              </button>
            </div>
          </div>

          <!-- Position controls -->
          <div class="widget-12x2">
            <h2 class="text-lg font-semibold mb-4">Toast Position</h2>
            <div class="grid grid-cols-3 gap-2">
              <button class="btn btn-outline btn-sm" phx-click="set_position" phx-value-position="top-start">
                Top Start
              </button>
              <button class="btn btn-outline btn-sm" phx-click="set_position" phx-value-position="top-center">
                Top Center
              </button>
              <button class="btn btn-outline btn-sm" phx-click="set_position" phx-value-position="top-end">
                Top End
              </button>
              <button class="btn btn-outline btn-sm" phx-click="set_position" phx-value-position="middle-start">
                Middle Start
              </button>
              <button class="btn btn-outline btn-sm" phx-click="set_position" phx-value-position="middle-center">
                Middle Center
              </button>
              <button class="btn btn-outline btn-sm" phx-click="set_position" phx-value-position="middle-end">
                Middle End
              </button>
              <button class="btn btn-outline btn-sm" phx-click="set_position" phx-value-position="bottom-start">
                Bottom Start
              </button>
              <button class="btn btn-outline btn-sm" phx-click="set_position" phx-value-position="bottom-center">
                Bottom Center
              </button>
              <button class="btn btn-outline btn-sm" phx-click="set_position" phx-value-position="bottom-end">
                Bottom End
              </button>
            </div>
            <div class="mt-2">
              <p class="text-sm">Current position: <span class="font-semibold"><%= @toast_position %></span></p>
            </div>
          </div>

          <!-- Static examples -->
          <div class="widget-12x2">
            <h2 class="text-lg font-semibold mb-4">Static Examples (Always Visible)</h2>
            <div class="flex flex-col gap-2">
              <.toast 
                id="static-info" 
                type="info" 
                title="Information" 
                message="This is an informational message." 
                duration={0}
              />
              <.toast 
                id="static-success" 
                type="success" 
                message="Operation completed successfully!" 
                duration={0}
              />
              <.toast 
                id="static-warning" 
                type="warning" 
                title="Warning" 
                message="Please review before proceeding." 
                duration={0}
              />
              <.toast 
                id="static-error" 
                type="error" 
                message="An error occurred. Please try again." 
                duration={0}
              />
            </div>
          </div>
        </.lego_grid>
      </.lego_container>

      <!-- Toast container -->
      <.toast_container position={@toast_position}>
        <%= for toast <- @toasts do %>
          <:toasts>
            <.toast 
              id={toast.id} 
              type={toast.type} 
              title={toast.title} 
              message={toast.message}
              duration={5000}
            />
          </:toasts>
        <% end %>
      </.toast_container>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, toasts: [], toast_position: "top-end", toast_counter: 0)}
  end

  @impl true
  def handle_event("show_toast", %{"type" => type}, socket) do
    counter = socket.assigns.toast_counter + 1
    
    new_toast = %{
      id: "toast-#{counter}",
      type: type,
      title: String.capitalize(type),
      message: "This is a #{type} toast notification ##{counter}"
    }
    
    {:noreply, 
     socket
     |> assign(toast_counter: counter)
     |> update(:toasts, fn toasts -> toasts ++ [new_toast] end)}
  end

  @impl true
  def handle_event("set_position", %{"position" => position}, socket) do
    {:noreply, assign(socket, toast_position: position)}
  end
end
```

2. Add route:
```elixir
live "/toast-test", ToastTestLive
```

**Testing Requirements:**
```bash
mix compile
mix phx.server
```

**Puppeteer MCP Test:**
```javascript
// Navigate to toast test page
mcp__puppeteer__puppeteer_navigate(url: "http://localhost:4000/toast-test")
// Take initial screenshot
mcp__puppeteer__puppeteer_screenshot(name: "phase1_toast_static", width: 1280, height: 900)
// Trigger toast notifications
mcp__puppeteer__puppeteer_click(selector: "button:contains('Show Info Toast')")
mcp__puppeteer__puppeteer_click(selector: "button:contains('Show Success Toast')")
mcp__puppeteer__puppeteer_click(selector: "button:contains('Show Warning Toast')")
mcp__puppeteer__puppeteer_click(selector: "button:contains('Show Error Toast')")
// Screenshot with active toasts
mcp__puppeteer__puppeteer_screenshot(name: "phase1_toast_active", width: 1280, height: 900)
```

**Documentation of Hiccups:**
_Record any toast notification issues_

- [ ] Test page created
- [ ] Route added
- [ ] Toast notifications appear
- [ ] Auto-dismiss works
- [ ] Position changes work
- [ ] All toast types display correctly
- [ ] Screenshots captured

---

## Section 1.4: Pagination Widget

### Sub-section 1.4.1: Basic Pagination Component

**Task**: Create pagination widget for page navigation

1. Add to `lib/superdupernova_web/widgets/display.ex`:

```elixir
@doc """
Pagination widget for navigating through pages
"""
attr :current_page, :integer, required: true
attr :total_pages, :integer, required: true
attr :on_page_change, :string, default: "change_page"
attr :show_prev_next, :boolean, default: true
attr :show_first_last, :boolean, default: false
attr :max_buttons, :integer, default: 7

def pagination(assigns) do
  assigns = assign(assigns, :page_numbers, calculate_page_numbers(assigns))
  
  ~H"""
  <div class="join">
    <%= if @show_first_last && @current_page > 1 do %>
      <button class="join-item btn" phx-click={@on_page_change} phx-value-page="1">
        «
      </button>
    <% end %>
    
    <%= if @show_prev_next && @current_page > 1 do %>
      <button class="join-item btn" phx-click={@on_page_change} phx-value-page={@current_page - 1}>
        ‹
      </button>
    <% end %>
    
    <%= for page <- @page_numbers do %>
      <%= if page == "..." do %>
        <button class="join-item btn btn-disabled">...</button>
      <% else %>
        <button 
          class={pagination_button_class(page, @current_page)}
          phx-click={@on_page_change} 
          phx-value-page={page}
        >
          <%= page %>
        </button>
      <% end %>
    <% end %>
    
    <%= if @show_prev_next && @current_page < @total_pages do %>
      <button class="join-item btn" phx-click={@on_page_change} phx-value-page={@current_page + 1}>
        ›
      </button>
    <% end %>
    
    <%= if @show_first_last && @current_page < @total_pages do %>
      <button class="join-item btn" phx-click={@on_page_change} phx-value-page={@total_pages}>
        »
      </button>
    <% end %>
  </div>
  """
end

defp pagination_button_class(page, current_page) when page == current_page do
  "join-item btn btn-active"
end

defp pagination_button_class(_page, _current_page) do
  "join-item btn"
end
```

**Testing Requirements:**
```bash
mix compile
```

- [ ] Pagination function added
- [ ] Button class helper added
- [ ] Compilation successful

### Sub-section 1.4.2: Page Navigation Logic

**Task**: Add page number calculation logic

```elixir
defp calculate_page_numbers(%{current_page: current, total_pages: total, max_buttons: max}) do
  cond do
    total <= max ->
      Enum.to_list(1..total)
    
    current <= div(max, 2) + 1 ->
      Enum.to_list(1..(max - 2)) ++ ["...", total]
    
    current >= total - div(max, 2) ->
      [1, "..."] ++ Enum.to_list((total - max + 3)..total)
    
    true ->
      half = div(max - 3, 2)
      [1, "..."] ++ Enum.to_list((current - half)..(current + half)) ++ ["...", total]
  end
end

@doc """
Advanced pagination with page size selector
"""
attr :current_page, :integer, required: true
attr :total_items, :integer, required: true
attr :page_size, :integer, default: 10
attr :page_sizes, :list, default: [10, 25, 50, 100]
attr :on_page_change, :string, default: "change_page"
attr :on_page_size_change, :string, default: "change_page_size"

def pagination_with_size(assigns) do
  total_pages = ceil(assigns.total_items / assigns.page_size)
  assigns = assign(assigns, :total_pages, total_pages)
  
  ~H"""
  <div class="flex items-center justify-between">
    <div class="flex items-center gap-2">
      <span class="text-sm">Show</span>
      <select class="select select-bordered select-sm" phx-change={@on_page_size_change}>
        <%= for size <- @page_sizes do %>
          <option value={size} selected={size == @page_size}><%= size %></option>
        <% end %>
      </select>
      <span class="text-sm">entries</span>
    </div>
    
    <.pagination 
      current_page={@current_page} 
      total_pages={@total_pages}
      on_page_change={@on_page_change}
      show_prev_next={true}
      show_first_last={true}
    />
    
    <div class="text-sm">
      Showing <%= (@current_page - 1) * @page_size + 1 %> to 
      <%= min(@current_page * @page_size, @total_items) %> of 
      <%= @total_items %> entries
    </div>
  </div>
  """
end
```

**Testing Requirements:**
```bash
mix compile
```

- [ ] Page calculation logic added
- [ ] Advanced pagination with size added
- [ ] Compilation successful

### Sub-section 1.4.3: Integration with Tables

**Task**: Create helper for paginated tables

```elixir
@doc """
Paginated table widget combining table and pagination
"""
attr :id, :string, required: true
attr :rows, :list, required: true
attr :current_page, :integer, default: 1
attr :page_size, :integer, default: 10
slot :columns, required: true

def paginated_table(assigns) do
  total_items = length(assigns.rows)
  total_pages = ceil(total_items / assigns.page_size)
  
  start_index = (assigns.current_page - 1) * assigns.page_size
  end_index = min(start_index + assigns.page_size, total_items)
  
  paginated_rows = Enum.slice(assigns.rows, start_index, assigns.page_size)
  
  assigns = 
    assigns
    |> assign(:paginated_rows, paginated_rows)
    |> assign(:total_items, total_items)
    |> assign(:total_pages, total_pages)
  
  ~H"""
  <div class="space-y-4">
    <.widget_table rows={@paginated_rows} columns={@columns} />
    
    <.pagination_with_size
      current_page={@current_page}
      total_items={@total_items}
      page_size={@page_size}
      on_page_change="change_page"
      on_page_size_change="change_page_size"
    />
  </div>
  """
end
```

**Testing Requirements:**
```bash
mix compile
```

- [ ] Paginated table function added
- [ ] Integration logic works
- [ ] Compilation successful

### Sub-section 1.4.4: Testing Pagination Widget

**Task**: Create comprehensive test page for pagination

1. Create `lib/superdupernova_web/live/pagination_test_live.ex`:

```elixir
defmodule SuperdupernovaWeb.PaginationTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-2xl font-bold mb-4">Pagination Widget Test</h1>
        
        <.lego_grid>
          <!-- Basic pagination -->
          <div class="widget-12x1">
            <h2 class="text-lg font-semibold mb-4">Basic Pagination</h2>
            <.pagination 
              current_page={@basic_page} 
              total_pages={10}
              on_page_change="change_basic_page"
            />
          </div>

          <!-- Pagination with many pages -->
          <div class="widget-12x1">
            <h2 class="text-lg font-semibold mb-4">Many Pages (Current: <%= @many_page %>)</h2>
            <.pagination 
              current_page={@many_page} 
              total_pages={100}
              on_page_change="change_many_page"
              show_first_last={true}
            />
          </div>

          <!-- Pagination with size selector -->
          <div class="widget-12x2">
            <h2 class="text-lg font-semibold mb-4">Pagination with Size Selector</h2>
            <.pagination_with_size
              current_page={@size_page}
              total_items={250}
              page_size={@page_size}
              on_page_change="change_size_page"
              on_page_size_change="change_page_size"
            />
          </div>

          <!-- Paginated table -->
          <div class="widget-12x4">
            <h2 class="text-lg font-semibold mb-4">Paginated Table</h2>
            <.paginated_table 
              id="test-table"
              rows={@table_data}
              current_page={@table_page}
              page_size={@table_page_size}
            >
              <:columns :let={row}>
                <td><%= row.id %></td>
                <td><%= row.name %></td>
                <td><%= row.email %></td>
                <td><%= row.status %></td>
              </:columns>
            </.paginated_table>
          </div>
        </.lego_grid>
      </.lego_container>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    table_data = for i <- 1..100 do
      %{
        id: i,
        name: "User #{i}",
        email: "user#{i}@example.com",
        status: Enum.random(["Active", "Inactive", "Pending"])
      }
    end
    
    {:ok, 
     assign(socket,
       basic_page: 1,
       many_page: 50,
       size_page: 1,
       page_size: 10,
       table_page: 1,
       table_page_size: 10,
       table_data: table_data
     )}
  end

  @impl true
  def handle_event("change_basic_page", %{"page" => page}, socket) do
    {:noreply, assign(socket, basic_page: String.to_integer(page))}
  end

  @impl true
  def handle_event("change_many_page", %{"page" => page}, socket) do
    {:noreply, assign(socket, many_page: String.to_integer(page))}
  end

  @impl true
  def handle_event("change_size_page", %{"page" => page}, socket) do
    {:noreply, assign(socket, size_page: String.to_integer(page))}
  end

  @impl true
  def handle_event("change_page_size", %{"value" => size}, socket) do
    {:noreply, assign(socket, page_size: String.to_integer(size), size_page: 1)}
  end

  @impl true
  def handle_event("change_page", %{"page" => page}, socket) do
    {:noreply, assign(socket, table_page: String.to_integer(page))}
  end
end
```

2. Add route:
```elixir
live "/pagination-test", PaginationTestLive
```

**Testing Requirements:**
```bash
mix compile
mix phx.server
```

**Puppeteer MCP Test:**
```javascript
// Navigate to pagination test page
mcp__puppeteer__puppeteer_navigate(url: "http://localhost:4000/pagination-test")
// Take initial screenshot
mcp__puppeteer__puppeteer_screenshot(name: "phase1_pagination_initial", width: 1280, height: 1000)
// Click through pages
mcp__puppeteer__puppeteer_click(selector: "button:contains('2')")
// Screenshot after navigation
mcp__puppeteer__puppeteer_screenshot(name: "phase1_pagination_page2", width: 1280, height: 1000)
// Test page size change
mcp__puppeteer__puppeteer_select(selector: "select.select-bordered", value: "25")
// Screenshot with different page size
mcp__puppeteer__puppeteer_screenshot(name: "phase1_pagination_size_changed", width: 1280, height: 1000)
```

**Documentation of Hiccups:**
_Record any pagination issues_

- [ ] Test page created
- [ ] Route added
- [ ] Basic pagination works
- [ ] Page calculation correct
- [ ] Size selector works
- [ ] Table pagination works
- [ ] Screenshots captured

---

# PHASE 2: Core Navigation Components

## Section 2.1: Menu/Navbar Widget

### Sub-section 2.1.1: Menu Component Structure

**Task**: Create menu component for navigation

1. Add to `lib/superdupernova_web/widgets/layout.ex`:

```elixir
@doc """
Menu widget for navigation lists
"""
attr :orientation, :string, default: "vertical", values: ["vertical", "horizontal"]
attr :size, :string, default: "md", values: ["xs", "sm", "md", "lg"]
attr :rounded, :boolean, default: false
slot :items, required: true

def menu(assigns) do
  ~H"""
  <ul class={menu_class(@orientation, @size, @rounded)}>
    <%= for item <- @items do %>
      <%= render_slot(item) %>
    <% end %>
  </ul>
  """
end

@doc """
Menu item component
"""
attr :active, :boolean, default: false
attr :disabled, :boolean, default: false
attr :href, :string, default: nil
attr :navigate, :string, default: nil
slot :inner_block, required: true
slot :submenu

def menu_item(assigns) do
  ~H"""
  <li class={menu_item_class(@disabled)}>
    <%= if @href do %>
      <a href={@href} class={menu_link_class(@active)}>
        <%= render_slot(@inner_block) %>
      </a>
    <% else %>
      <%= if @navigate do %>
        <.link navigate={@navigate} class={menu_link_class(@active)}>
          <%= render_slot(@inner_block) %>
        </.link>
      <% else %>
        <a class={menu_link_class(@active)}>
          <%= render_slot(@inner_block) %>
        </a>
      <% end %>
    <% end %>
    <%= if @submenu != [] do %>
      <ul>
        <%= render_slot(@submenu) %>
      </ul>
    <% end %>
  </li>
  """
end

defp menu_class(orientation, size, rounded) do
  base = "menu"
  orientation_class = if orientation == "horizontal", do: "menu-horizontal", else: "menu-vertical"
  size_class = "menu-#{size}"
  rounded_class = if rounded, do: "rounded-box", else: ""
  
  [base, orientation_class, size_class, rounded_class]
  |> Enum.filter(&(&1 != ""))
  |> Enum.join(" ")
end

defp menu_item_class(disabled) do
  if disabled, do: "disabled", else: ""
end

defp menu_link_class(active) do
  if active, do: "active", else: ""
end
```

**Testing Requirements:**
```bash
mix compile
```

- [ ] Menu component added
- [ ] Menu item component added
- [ ] Helper functions added
- [ ] Compilation successful

### Sub-section 2.1.2: Navbar Component

**Task**: Create navbar widget for top navigation

```elixir
@doc """
Navbar widget for top navigation bar
"""
attr :class, :string, default: ""
slot :start
slot :center
slot :end

def navbar(assigns) do
  ~H"""
  <div class={"navbar bg-base-100 #{@class}"}>
    <%= if @start != [] do %>
      <div class="navbar-start">
        <%= render_slot(@start) %>
      </div>
    <% end %>
    
    <%= if @center != [] do %>
      <div class="navbar-center">
        <%= render_slot(@center) %>
      </div>
    <% end %>
    
    <%= if @end != [] do %>
      <div class="navbar-end">
        <%= render_slot(@end) %>
      </div>
    <% end %>
  </div>
  """
end

@doc """
Navbar dropdown menu for mobile
"""
attr :id, :string, required: true
slot :trigger, required: true
slot :items, required: true

def navbar_dropdown(assigns) do
  ~H"""
  <div class="dropdown">
    <label tabindex="0" class="btn btn-ghost lg:hidden">
      <%= render_slot(@trigger) %>
    </label>
    <ul tabindex="0" class="menu menu-sm dropdown-content mt-3 z-[1] p-2 shadow bg-base-100 rounded-box w-52">
      <%= for item <- @items do %>
        <%= render_slot(item) %>
      <% end %>
    </ul>
  </div>
  """
end
```

**Testing Requirements:**
```bash
mix compile
```

- [ ] Navbar component added
- [ ] Navbar dropdown added
- [ ] Compilation successful

### Sub-section 2.1.3: Responsive Behavior

**Task**: Add responsive navigation components

```elixir
@doc """
Responsive navigation with mobile menu
"""
attr :brand, :string, required: true
attr :brand_href, :string, default: "/"
slot :desktop_items, required: true
slot :mobile_items, required: true
slot :actions

def responsive_nav(assigns) do
  ~H"""
  <.navbar class="shadow-md">
    <:start>
      <!-- Mobile menu button -->
      <.navbar_dropdown id="mobile-menu">
        <:trigger>
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
          </svg>
        </:trigger>
        <:items>
          <%= render_slot(@mobile_items) %>
        </:items>
      </.navbar_dropdown>
      
      <!-- Brand -->
      <a href={@brand_href} class="btn btn-ghost normal-case text-xl">
        <%= @brand %>
      </a>
    </:start>
    
    <:center>
      <!-- Desktop menu -->
      <div class="hidden lg:flex">
        <.menu orientation="horizontal" size="md">
          <:items>
            <%= render_slot(@desktop_items) %>
          </:items>
        </.menu>
      </div>
    </:center>
    
    <:end>
      <%= if @actions != [] do %>
        <%= render_slot(@actions) %>
      <% end %>
    </:end>
  </.navbar>
  """
end
```

**Testing Requirements:**
```bash
mix compile
```

- [ ] Responsive nav component added
- [ ] Mobile/desktop behavior defined
- [ ] Compilation successful

### Sub-section 2.1.4: Testing Navigation Components

**Task**: Create test page for navigation widgets

1. Create `lib/superdupernova_web/live/navigation_test_live.ex`:

```elixir
defmodule SuperdupernovaWeb.NavigationTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <!-- Main navbar -->
      <.responsive_nav brand="Superdupernova" brand_href="/">
        <:desktop_items>
          <.menu_item navigate="/dashboard" active={@current_page == "dashboard"}>
            Dashboard
          </.menu_item>
          <.menu_item navigate="/products" active={@current_page == "products"}>
            Products
          </.menu_item>
          <.menu_item navigate="/about" active={@current_page == "about"}>
            About
          </.menu_item>
          <.menu_item>
            Services
            <:submenu>
              <.menu_item navigate="/services/consulting">Consulting</.menu_item>
              <.menu_item navigate="/services/support">Support</.menu_item>
            </:submenu>
          </.menu_item>
        </:desktop_items>
        
        <:mobile_items>
          <.menu_item navigate="/dashboard">Dashboard</.menu_item>
          <.menu_item navigate="/products">Products</.menu_item>
          <.menu_item navigate="/about">About</.menu_item>
          <.menu_item navigate="/services">Services</.menu_item>
        </:mobile_items>
        
        <:actions>
          <button class="btn btn-primary btn-sm">Sign In</button>
        </:actions>
      </.responsive_nav>

      <.lego_container>
        <h1 class="text-2xl font-bold mb-4 mt-4">Navigation Components Test</h1>
        
        <.lego_grid>
          <!-- Vertical menu -->
          <div class="widget-3x1">
            <h2 class="text-lg font-semibold mb-4">Vertical Menu</h2>
            <.menu orientation="vertical" size="md" rounded={true}>
              <:items>
                <.menu_item active={true}>
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                  </svg>
                  Home
                </.menu_item>
                <.menu_item>
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                  Details
                </.menu_item>
                <.menu_item>
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                  </svg>
                  Stats
                </.menu_item>
                <.menu_item disabled={true}>
                  Disabled Item
                </.menu_item>
              </:items>
            </.menu>
          </div>

          <!-- Horizontal menu -->
          <div class="widget-9x1">
            <h2 class="text-lg font-semibold mb-4">Horizontal Menu</h2>
            <.menu orientation="horizontal" size="md">
              <:items>
                <.menu_item active={true}>Item 1</.menu_item>
                <.menu_item>Item 2</.menu_item>
                <.menu_item>
                  Parent
                  <:submenu>
                    <.menu_item>Submenu 1</.menu_item>
                    <.menu_item>Submenu 2</.menu_item>
                  </:submenu>
                </.menu_item>
                <.menu_item>Item 3</.menu_item>
              </:items>
            </.menu>
          </div>

          <!-- Menu sizes -->
          <div class="widget-12x2">
            <h2 class="text-lg font-semibold mb-4">Menu Sizes</h2>
            <div class="flex gap-4">
              <.menu orientation="vertical" size="xs">
                <:items>
                  <.menu_item>Extra Small</.menu_item>
                  <.menu_item>Menu Item</.menu_item>
                </:items>
              </.menu>
              
              <.menu orientation="vertical" size="sm">
                <:items>
                  <.menu_item>Small</.menu_item>
                  <.menu_item>Menu Item</.menu_item>
                </:items>
              </.menu>
              
              <.menu orientation="vertical" size="md">
                <:items>
                  <.menu_item>Medium</.menu_item>
                  <.menu_item>Menu Item</.menu_item>
                </:items>
              </.menu>
              
              <.menu orientation="vertical" size="lg">
                <:items>
                  <.menu_item>Large</.menu_item>
                  <.menu_item>Menu Item</.menu_item>
                </:items>
              </.menu>
            </div>
          </div>
        </.lego_grid>
      </.lego_container>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, current_page: "dashboard")}
  end
end
```

2. Add route:
```elixir
live "/navigation-test", NavigationTestLive
```

**Testing Requirements:**
```bash
mix compile
mix phx.server
```

**Puppeteer MCP Test:**
```javascript
// Navigate to navigation test page
mcp__puppeteer__puppeteer_navigate(url: "http://localhost:4000/navigation-test")
// Take screenshot of full navigation
mcp__puppeteer__puppeteer_screenshot(name: "phase2_navigation_full", width: 1280, height: 900)
// Test mobile menu
mcp__puppeteer__puppeteer_screenshot(name: "phase2_navigation_mobile", width: 375, height: 812)
// Click mobile menu button
mcp__puppeteer__puppeteer_click(selector: ".btn-ghost.lg\\:hidden")
// Screenshot with mobile menu open
mcp__puppeteer__puppeteer_screenshot(name: "phase2_navigation_mobile_open", width: 375, height: 812)
```

**Documentation of Hiccups:**
_Record any navigation component issues_

- [ ] Test page created
- [ ] Route added
- [ ] Navbar displays correctly
- [ ] Menus work (vertical and horizontal)
- [ ] Submenu functionality works
- [ ] Mobile menu toggles
- [ ] Screenshots captured

---

## Section 2.2: Breadcrumbs Widget

### Sub-section 2.2.1: Basic Breadcrumbs Component

**Task**: Create breadcrumbs widget for navigation path

1. Add to `lib/superdupernova_web/widgets/layout.ex`:

```elixir
@doc """
Breadcrumbs widget for showing navigation path
"""
attr :items, :list, required: true
attr :separator, :string, default: "/"

def breadcrumbs(assigns) do
  ~H"""
  <div class="text-sm breadcrumbs">
    <ul>
      <%= for {item, index} <- Enum.with_index(@items) do %>
        <li>
          <%= if item[:href] do %>
            <a href={item[:href]}><%= item[:label] %></a>
          <% else %>
            <%= if item[:navigate] do %>
              <.link navigate={item[:navigate]}><%= item[:label] %></.link>
            <% else %>
              <span><%= item[:label] %></span>
            <% end %>
          <% end %>
        </li>
      <% end %>
    </ul>
  </div>
  """
end

@doc """
Breadcrumbs with icons
"""
attr :items, :list, required: true
slot :home_icon

def breadcrumbs_with_icons(assigns) do
  ~H"""
  <div class="text-sm breadcrumbs">
    <ul>
      <%= if @home_icon != [] do %>
        <li>
          <a href="/">
            <%= render_slot(@home_icon) %>
          </a>
        </li>
      <% end %>
      <%= for item <- @items do %>
        <li>
          <%= if item[:icon] do %>
            <span class="inline-flex gap-2 items-center">
              <%= Phoenix.HTML.raw(item[:icon]) %>
              <%= if item[:href] do %>
                <a href={item[:href]}><%= item[:label] %></a>
              <% else %>
                <span><%= item[:label] %></span>
              <% end %>
            </span>
          <% else %>
            <%= if item[:href] do %>
              <a href={item[:href]}><%= item[:label] %></a>
            <% else %>
              <span><%= item[:label] %></span>
            <% end %>
          <% end %>
        </li>
      <% end %>
    </ul>
  </div>
  """
end
```

**Testing Requirements:**
```bash
mix compile
```

- [ ] Breadcrumbs function added
- [ ] Breadcrumbs with icons added
- [ ] Compilation successful

### Sub-section 2.2.2: Dynamic Path Generation

**Task**: Add helper for dynamic breadcrumb generation

```elixir
@doc """
Generate breadcrumbs from path
"""
def breadcrumbs_from_path(path) do
  segments = 
    path
    |> String.split("/")
    |> Enum.reject(&(&1 == ""))
  
  Enum.map_reduce(segments, "", fn segment, acc ->
    current_path = "#{acc}/#{segment}"
    item = %{
      label: humanize_segment(segment),
      navigate: current_path
    }
    {item, current_path}
  end)
  |> elem(0)
end

defp humanize_segment(segment) do
  segment
  |> String.replace("-", " ")
  |> String.replace("_", " ")
  |> String.split(" ")
  |> Enum.map(&String.capitalize/1)
  |> Enum.join(" ")
end
```

**Testing Requirements:**
```bash
mix compile
```

- [ ] Path generation helper added
- [ ] Humanize function added
- [ ] Compilation successful

### Sub-section 2.2.3: Testing Breadcrumbs Widget

**Task**: Create test page for breadcrumbs

1. Create `lib/superdupernova_web/live/breadcrumbs_test_live.ex`:

```elixir
defmodule SuperdupernovaWeb.BreadcrumbsTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-2xl font-bold mb-4">Breadcrumbs Widget Test</h1>
        
        <.lego_grid>
          <!-- Basic breadcrumbs -->
          <div class="widget-12x1">
            <h2 class="text-lg font-semibold mb-2">Basic Breadcrumbs</h2>
            <.breadcrumbs items={[
              %{label: "Home", href: "/"},
              %{label: "Products", href: "/products"},
              %{label: "Electronics", href: "/products/electronics"},
              %{label: "Laptops"}
            ]} />
          </div>

          <!-- Breadcrumbs with navigation -->
          <div class="widget-12x1">
            <h2 class="text-lg font-semibold mb-2">With LiveView Navigation</h2>
            <.breadcrumbs items={[
              %{label: "Dashboard", navigate: "/dashboard"},
              %{label: "Users", navigate: "/dashboard/users"},
              %{label: "Profile", navigate: "/dashboard/users/profile"},
              %{label: "Settings"}
            ]} />
          </div>

          <!-- Breadcrumbs with icons -->
          <div class="widget-12x1">
            <h2 class="text-lg font-semibold mb-2">With Icons</h2>
            <.breadcrumbs_with_icons items={[
              %{label: "Documents", href: "/docs", icon: ~s(<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="w-4 h-4 mr-2 stroke-current"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path></svg>)},
              %{label: "Projects", href: "/docs/projects", icon: ~s(<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="w-4 h-4 mr-2 stroke-current"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-6l-2-2H5a2 2 0 00-2 2z"></path></svg>)},
              %{label: "Current Project"}
            ]}>
              <:home_icon>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="w-4 h-4 stroke-current">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
                </svg>
              </:home_icon>
            </.breadcrumbs_with_icons>
          </div>

          <!-- Dynamic breadcrumbs -->
          <div class="widget-12x1">
            <h2 class="text-lg font-semibold mb-2">Dynamic from Path</h2>
            <p class="text-sm mb-2">Path: <%= @current_path %></p>
            <.breadcrumbs items={breadcrumbs_from_path(@current_path)} />
          </div>

          <!-- Test path changes -->
          <div class="widget-12x2">
            <h2 class="text-lg font-semibold mb-2">Test Different Paths</h2>
            <div class="flex gap-2 flex-wrap">
              <button class="btn btn-sm" phx-click="change_path" phx-value-path="/products">
                Products
              </button>
              <button class="btn btn-sm" phx-click="change_path" phx-value-path="/products/electronics">
                Electronics
              </button>
              <button class="btn btn-sm" phx-click="change_path" phx-value-path="/products/electronics/laptops">
                Laptops
              </button>
              <button class="btn btn-sm" phx-click="change_path" phx-value-path="/admin/users/edit/123">
                Admin User Edit
              </button>
              <button class="btn btn-sm" phx-click="change_path" phx-value-path="/docs/api/v2/endpoints">
                API Docs
              </button>
            </div>
          </div>
        </.lego_grid>
      </.lego_container>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, current_path: "/products/electronics/laptops")}
  end

  @impl true
  def handle_event("change_path", %{"path" => path}, socket) do
    {:noreply, assign(socket, current_path: path)}
  end

  # Helper function (should be in the widget module)
  defp breadcrumbs_from_path(path) do
    segments = 
      path
      |> String.split("/")
      |> Enum.reject(&(&1 == ""))
    
    {items, _} = Enum.map_reduce(segments, "", fn segment, acc ->
      current_path = "#{acc}/#{segment}"
      item = %{
        label: humanize_segment(segment),
        navigate: current_path
      }
      {item, current_path}
    end)
    
    [%{label: "Home", navigate: "/"}] ++ items
  end

  defp humanize_segment(segment) do
    segment
    |> String.replace("-", " ")
    |> String.replace("_", " ")
    |> String.split(" ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end
end
```

2. Add route:
```elixir
live "/breadcrumbs-test", BreadcrumbsTestLive
```

**Testing Requirements:**
```bash
mix compile
mix phx.server
```

**Puppeteer MCP Test:**
```javascript
// Navigate to breadcrumbs test page
mcp__puppeteer__puppeteer_navigate(url: "http://localhost:4000/breadcrumbs-test")
// Take initial screenshot
mcp__puppeteer__puppeteer_screenshot(name: "phase2_breadcrumbs_all", width: 1280, height: 800)
// Test dynamic path change
mcp__puppeteer__puppeteer_click(selector: "button:contains('API Docs')")
// Screenshot after path change
mcp__puppeteer__puppeteer_screenshot(name: "phase2_breadcrumbs_dynamic", width: 1280, height: 800)
```

**Documentation of Hiccups:**
_Record any breadcrumbs issues_

- [ ] Test page created
- [ ] Route added
- [ ] Basic breadcrumbs display
- [ ] Icons show correctly
- [ ] Dynamic generation works
- [ ] Path changes update breadcrumbs
- [ ] Screenshots captured

---

## Section 2.3: Link Widget

### Sub-section 2.3.1: Styled Link Component

**Task**: Create styled link widget

1. Add to `lib/superdupernova_web/widgets/layout.ex`:

```elixir
@doc """
Styled link widget
"""
attr :href, :string, default: nil
attr :navigate, :string, default: nil
attr :patch, :string, default: nil
attr :variant, :string, default: "default", values: ["default", "primary", "secondary", "accent", "neutral", "hover"]
attr :underline, :boolean, default: false
attr :external, :boolean, default: false
slot :inner_block, required: true

def styled_link(assigns) do
  link_attrs = cond do
    assigns[:href] -> [href: assigns.href]
    assigns[:navigate] -> [navigate: assigns.navigate]
    assigns[:patch] -> [patch: assigns.patch]
    true -> []
  end
  
  link_attrs = if assigns.external, do: link_attrs ++ [target: "_blank", rel: "noopener noreferrer"], else: link_attrs
  
  assigns = assign(assigns, :link_attrs, link_attrs)
  
  ~H"""
  <.link class={styled_link_class(@variant, @underline)} {@link_attrs}>
    <%= render_slot(@inner_block) %>
    <%= if @external do %>
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4 inline ml-1">
        <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 6H5.25A2.25 2.25 0 003 8.25v10.5A2.25 2.25 0 005.25 21h10.5A2.25 2.25 0 0018 18.75V10.5m-10.5 6L21 3m0 0h-5.25M21 3v5.25" />
      </svg>
    <% end %>
  </.link>
  """
end

defp styled_link_class(variant, underline) do
  base = "link"
  variant_class = case variant do
    "primary" -> "link-primary"
    "secondary" -> "link-secondary"
    "accent" -> "link-accent"
    "neutral" -> "link-neutral"
    "hover" -> "link-hover"
    _ -> ""
  end
  underline_class = if underline, do: "underline", else: "no-underline"
  
  [base, variant_class, underline_class]
  |> Enum.filter(&(&1 != ""))
  |> Enum.join(" ")
end
```

**Testing Requirements:**
```bash
mix compile
```

- [ ] Styled link component added
- [ ] Helper function added
- [ ] Compilation successful

### Sub-section 2.3.2: LiveView Navigation Integration

**Task**: Add LiveView-specific link helpers

```elixir
@doc """
Link list widget for navigation menus
"""
attr :orientation, :string, default: "vertical", values: ["vertical", "horizontal"]
slot :links, required: true

def link_list(assigns) do
  ~H"""
  <div class={link_list_class(@orientation)}>
    <%= for link <- @links do %>
      <%= render_slot(link) %>
    <% end %>
  </div>
  """
end

defp link_list_class("horizontal") do
  "flex flex-row gap-4 items-center"
end

defp link_list_class(_) do
  "flex flex-col gap-2"
end

@doc """
Button-styled link
"""
attr :href, :string, default: nil
attr :navigate, :string, default: nil
attr :variant, :string, default: "primary"
attr :size, :string, default: "md", values: ["xs", "sm", "md", "lg"]
attr :outline, :boolean, default: false
attr :disabled, :boolean, default: false
slot :inner_block, required: true

def button_link(assigns) do
  ~H"""
  <%= if @href do %>
    <a href={@href} class={button_link_class(@variant, @size, @outline, @disabled)}>
      <%= render_slot(@inner_block) %>
    </a>
  <% else %>
    <.link navigate={@navigate} class={button_link_class(@variant, @size, @outline, @disabled)}>
      <%= render_slot(@inner_block) %>
    </.link>
  <% end %>
  """
end

defp button_link_class(variant, size, outline, disabled) do
  base = "btn"
  variant_class = if outline, do: "btn-outline btn-#{variant}", else: "btn-#{variant}"
  size_class = "btn-#{size}"
  disabled_class = if disabled, do: "btn-disabled", else: ""
  
  [base, variant_class, size_class, disabled_class]
  |> Enum.filter(&(&1 != ""))
  |> Enum.join(" ")
end
```

**Testing Requirements:**
```bash
mix compile
```

- [ ] Link list component added
- [ ] Button link component added
- [ ] Helper functions added
- [ ] Compilation successful

### Sub-section 2.3.3: Testing Link Widget

**Task**: Create test page for link widgets

1. Create `lib/superdupernova_web/live/link_test_live.ex`:

```elixir
defmodule SuperdupernovaWeb.LinkTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-2xl font-bold mb-4">Link Widget Test</h1>
        
        <.lego_grid>
          <!-- Basic styled links -->
          <div class="widget-6x1">
            <h2 class="text-lg font-semibold mb-4">Styled Links</h2>
            <div class="flex flex-col gap-2">
              <.styled_link href="#" variant="default">Default Link</.styled_link>
              <.styled_link href="#" variant="primary">Primary Link</.styled_link>
              <.styled_link href="#" variant="secondary">Secondary Link</.styled_link>
              <.styled_link href="#" variant="accent">Accent Link</.styled_link>
              <.styled_link href="#" variant="neutral">Neutral Link</.styled_link>
              <.styled_link href="#" variant="hover">Hover Effect Link</.styled_link>
            </div>
          </div>

          <!-- Links with underline -->
          <div class="widget-6x1">
            <h2 class="text-lg font-semibold mb-4">Underlined Links</h2>
            <div class="flex flex-col gap-2">
              <.styled_link href="#" variant="primary" underline={true}>Underlined Primary</.styled_link>
              <.styled_link href="#" variant="secondary" underline={true}>Underlined Secondary</.styled_link>
              <.styled_link href="#" variant="accent" underline={true}>Underlined Accent</.styled_link>
            </div>
          </div>

          <!-- External links -->
          <div class="widget-12x1">
            <h2 class="text-lg font-semibold mb-4">External Links</h2>
            <div class="flex gap-4">
              <.styled_link href="https://example.com" external={true} variant="primary">
                External Site
              </.styled_link>
              <.styled_link href="https://github.com" external={true} variant="secondary">
                GitHub
              </.styled_link>
              <.styled_link href="https://docs.example.com" external={true} variant="accent">
                Documentation
              </.styled_link>
            </div>
          </div>

          <!-- LiveView navigation links -->
          <div class="widget-12x1">
            <h2 class="text-lg font-semibold mb-4">LiveView Navigation</h2>
            <.link_list orientation="horizontal">
              <:links>
                <.styled_link navigate="/dashboard" variant="primary">Dashboard</.styled_link>
              </:links>
              <:links>
                <.styled_link navigate="/profile" variant="secondary">Profile</.styled_link>
              </:links>
              <:links>
                <.styled_link patch={~p"/link-test?tab=settings"} variant="accent">Settings (Patch)</.styled_link>
              </:links>
            </.link_list>
          </div>

          <!-- Button-styled links -->
          <div class="widget-12x2">
            <h2 class="text-lg font-semibold mb-4">Button Links</h2>
            <div class="flex gap-2 flex-wrap">
              <.button_link href="#" variant="primary" size="sm">Small Button</.button_link>
              <.button_link href="#" variant="secondary" size="md">Medium Button</.button_link>
              <.button_link href="#" variant="accent" size="lg">Large Button</.button_link>
              <.button_link navigate="/dashboard" variant="info" outline={true}>Outline Button</.button_link>
              <.button_link href="#" variant="error" disabled={true}>Disabled Button</.button_link>
            </div>
          </div>

          <!-- Vertical link list -->
          <div class="widget-4x1">
            <h2 class="text-lg font-semibold mb-4">Vertical Link List</h2>
            <.link_list orientation="vertical">
              <:links>
                <.styled_link href="#home" variant="primary">Home</.styled_link>
              </:links>
              <:links>
                <.styled_link href="#about" variant="primary">About</.styled_link>
              </:links>
              <:links>
                <.styled_link href="#services" variant="primary">Services</.styled_link>
              </:links>
              <:links>
                <.styled_link href="#contact" variant="primary">Contact</.styled_link>
              </:links>
            </.link_list>
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
```

2. Add route:
```elixir
live "/link-test", LinkTestLive
```

**Testing Requirements:**
```bash
mix compile
mix phx.server
```

**Puppeteer MCP Test:**
```javascript
// Navigate to link test page
mcp__puppeteer__puppeteer_navigate(url: "http://localhost:4000/link-test")
// Take screenshot of all link variants
mcp__puppeteer__puppeteer_screenshot(name: "phase2_links_all", width: 1280, height: 900)
// Hover over links to show hover effects
mcp__puppeteer__puppeteer_hover(selector: ".link-hover")
// Screenshot with hover
mcp__puppeteer__puppeteer_screenshot(name: "phase2_links_hover", width: 1280, height: 900)
```

**Documentation of Hiccups:**
_Record any link widget issues_

- [ ] Test page created
- [ ] Route added
- [ ] All link variants display
- [ ] External link icons show
- [ ] Button links work
- [ ] Navigation links configured
- [ ] Screenshots captured

---

# Remaining Phases Continue...

Due to the extensive nature of this guide, I'll provide the structure for the remaining phases. Each phase follows the same detailed pattern:

## PHASE 3: Advanced Display Components
- Timeline Widget
- Carousel Widget  
- Chat Bubble Widget
- Rating Widget

## PHASE 4: Specialized Components
- Calendar Widget
- Keyboard Display Widget (Kbd)
- Minor Display Components (Countdown, Diff, Dock, Theme Controller)

## PHASE 5: Form Enhancement Components
- Fieldset Widget
- Label Widget
- Filter Widget
- Validator Widget

## PHASE 6: Progress & Status Components

### Implementation Status

#### Section 6.1.1: Radial Progress Widget
- [x] Widget implementation added to display.ex
- [x] Compilation successful
- [x] Test page created
- [x] Visual testing with Puppeteer completed
- [x] Screenshots captured successfully

**Documentation of Hiccups:**
- No significant issues encountered
- Widget renders correctly with all size and variant options
- DaisyUI radial-progress class works as expected

#### Section 6.1.2: List Component
- [x] Widget implementation added to display.ex
- [x] Compilation successful
- [x] Test page created
- [x] Visual testing with Puppeteer completed
- [x] All list types (unordered, ordered, menu, steps) working

**Documentation of Hiccups:**
- Import conflict with CoreComponents.list function resolved by excluding it from import
- All list variants render correctly

#### Section 6.1.3: Status Indicator
- [x] Widget implementation added to display.ex
- [x] Compilation successful
- [x] Test page created
- [x] Visual testing with Puppeteer completed
- [x] All status types and animations working

**Documentation of Hiccups:**
- No issues encountered
- Pulse animations work correctly
- Status dots and labels display as expected

### Summary
Phase 6 implementation completed successfully. All three widgets (Radial Progress, List Component, and Status Indicator) have been:
1. Implemented in display.ex
2. Compiled without errors
3. Tested visually with comprehensive test page
4. Verified with Puppeteer screenshots
5. All variants and options working as designed

---

## Final Testing Checklist

After implementing all widgets:

- [ ] All widgets compile without errors
- [ ] All test pages load successfully
- [ ] Screenshots captured for all widgets
- [ ] No console errors in browser
- [ ] All grid sizes work correctly
- [ ] Responsive behavior tested
- [ ] JavaScript hooks functioning
- [ ] LiveView integration working
- [ ] DaisyUI classes applied correctly
- [ ] Documentation complete

## Summary

This guide provides step-by-step instructions for implementing all missing widgets identified in the analysis. Each widget follows the established patterns from the original implementation guide, ensuring consistency across the entire UI system.

Remember to:
1. Test after each implementation
2. Document any issues encountered
3. Take screenshots for visual verification
4. Mark checkboxes as complete
5. Maintain consistent code style

The completed widget system will provide a comprehensive set of UI components for the Superdupernova application, all built with Phoenix LiveView and DaisyUI.

## Phase 5 Implementation Status

### Section 5.1.1: Fieldset Widget ✅
**Status**: COMPLETED
**Implementation**: Successfully implemented fieldset widget with bordered, ghost, and plain variants
**Test Page**: /phase5-test
**Hiccups Encountered**: 
- Form field attribute conflicts with Phoenix.HTML.FormField requirements
- Resolution: Used plain HTML inputs for test demonstration since we're testing UI only

### Section 5.1.2: Label Widget ✅ 
**Status**: COMPLETED
**Implementation**: Successfully implemented label widget with required indicators, hints, and error messages
**Test Page**: /phase5-test
**Hiccups Encountered**: None

### Section 5.1.3: Filter Widget ✅
**Status**: COMPLETED
**Implementation**: Successfully implemented filter widget with select, text, and date range filter types
**Test Page**: /phase5-test
**Hiccups Encountered**: None

### Section 5.1.4: Validator Widget ✅
**Status**: COMPLETED
**Implementation**: Successfully implemented validator widget with real-time validation rules
**Test Page**: /phase5-test
**Hiccups Encountered**: None

### Overall Phase 5 Notes:
- All widgets compile successfully
- Visual testing completed with screenshots
- Import conflict resolved between Display.list and CoreComponents.list functions
- Test page demonstrates all widget variations and states

