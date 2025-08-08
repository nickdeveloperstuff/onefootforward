# Lego Widget System Documentation

## Quick Start

```elixir
defmodule MyAppWeb.MyLive do
  use MyAppWeb, :live_view
  use SuperdupernovaWeb.Widgets
  
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <.lego_grid>
          <.text_input field={@form[:name]} label="Name" size="6x1" />
          <.button variant="primary" grid_size="2x1">Save</.button>
        </.lego_grid>
      </.lego_container>
    </div>
    """
  end
end
```

## Widget Reference

### Form Inputs
- `text_input` - Basic text input
- `email_input` - Email with validation
- `password_input` - Password field
- `number_input` - Numeric input
- `textarea` - Multi-line text
- `select_input` - Dropdown selection
- `checkbox` - Single checkbox
- `toggle` - Toggle switch
- `radio_group` - Radio button group
- `file_input` - File upload
- `date_input` - Date picker
- `time_input` - Time picker
- `datetime_input` - Date and time
- `range_slider` - Range selection

### Display Widgets
- `card` - Content card
- `alert` - Alert messages
- `badge` - Labels and tags
- `widget_table` - Data tables
- `progress` - Progress bars
- `stat` - Metric display
- `loading` - Loading spinner
- `skeleton` - Loading placeholder
- `steps` - Progress indicator

### Action Widgets
- `button` - Action button
- `icon_button` - Icon-only button
- `button_group` - Grouped buttons
- `dropdown` - Dropdown menu
- `modal` - Modal dialog

### Layout Widgets
- `lego_container` - Page container
- `lego_grid` - 12-column grid
- `form_section` - Form grouping
- `tabs` - Tabbed interface
- `accordion` - Collapsible sections
- `divider` - Visual separator
- `spacer` - Empty space
- `drawer` - Slide-out panel

## Grid Sizes

All widgets support standardized grid sizes:
- `1x1` - 1 column (minimal)
- `2x1` - 2 columns (compact)
- `4x1` - 4 columns (standard)
- `6x1` - 6 columns (half-width)
- `12x1` - 12 columns (full-width)
- `12x2` - Full width, 2 rows
- `12x4` - Full width, 4 rows

## Usage Examples

### Form Example
```elixir
<.form for={@form} phx-change="validate" phx-submit="save">
  <.form_section title="User Information">
    <.text_input field={@form[:name]} label="Name" size="6x1" />
    <.email_input field={@form[:email]} label="Email" size="6x1" />
    <.select_input field={@form[:role]} label="Role" size="4x1"
      options={[{"Admin", "admin"}, {"User", "user"}]} />
    <.toggle field={@form[:active]} label="Active" size="2x1" />
  </.form_section>
</.form>
```

### Display Example
```elixir
<.card title="User Statistics" size="6x4">
  <.stat title="Total Users" value="1,234" desc="↑ 12%" />
  <.progress value={75} variant="primary" />
  <.badge variant="success">Active</.badge>
</.card>
```

### Layout Example
```elixir
<.tabs active_tab={@active_tab} tabs={[
  {:overview, "Overview"},
  {:details, "Details"}
]}>
  <.tab_panel tab={:overview} active_tab={@active_tab}>
    <p>Overview content</p>
  </.tab_panel>
  <.tab_panel tab={:details} active_tab={@active_tab}>
    <p>Details content</p>
  </.tab_panel>
</.tabs>
```

### Advanced Widgets

#### Accordion
```elixir
<.accordion items={[
  {"q1", "Question 1", "Answer 1"},
  {"q2", "Question 2", "Answer 2"}
]} multiple={false} />
```

#### Drawer
```elixir
<.drawer id="nav-drawer">
  <:toggle>Menu</:toggle>
  <:content>
    <ul class="menu">
      <li><a>Home</a></li>
      <li><a>About</a></li>
    </ul>
  </:content>
  <:main>
    <p>Main content</p>
  </:main>
</.drawer>
```

#### Steps
```elixir
<.steps 
  steps={["Register", "Verify", "Complete"]} 
  current_step={1} 
/>
```

## Styling

All widgets use:
- DaisyUI component classes
- Tailwind CSS utilities
- 4pt atomic spacing system (`unit-1`, `unit-2`, etc.)
- Consistent color scheme from theme

## Best Practices

1. **Grid Usage**: Use the 12-column grid system for consistent layouts
2. **Size Consistency**: Use predefined size attributes for uniform appearance
3. **Form Sections**: Group related form fields using `form_section`
4. **Loading States**: Use `loading` and `skeleton` widgets for async operations
5. **Responsive Design**: Widgets adapt to screen size automatically
6. **Accessibility**: All widgets include proper ARIA attributes

## Integration with Ash Framework

The widget system integrates seamlessly with Ash resources:

```elixir
# Using with AshPhoenix.Form
form = AshPhoenix.Form.for_create(User, :register)
<.form for={@form}>
  <.text_input field={@form[:name]} label="Name" />
</.form>
```

## Testing

All widgets have been tested with:
- Phoenix LiveView test helpers
- Puppeteer visual testing
- Cross-browser compatibility
- Responsive design verification

## Contributing

To add new widgets:
1. Add widget function to appropriate module in `/widgets`
2. Follow existing patterns for attributes and slots
3. Use DaisyUI classes for consistent styling
4. Add documentation and examples
5. Test with Puppeteer MCP