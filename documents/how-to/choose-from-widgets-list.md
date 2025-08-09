# Superdupernova Widget Library - Complete Reference

## Overview
The Superdupernova project features **70+ Phoenix LiveView widgets** powered by DaisyUI and built on a Lego-brick UI system. This comprehensive reference lists every widget available in the project, organized by category.

## Widget Categories

### 🏗️ Layout Widgets (7 widgets)
Foundational components for page structure and organization.

| Widget | Dimensions | Variants | Description |
|--------|------------|----------|-------------|
| **lego_container** | Fluid container | - | Container component for consistent page layout |
| **lego_grid** | 12-column system | - | Grid system for responsive layouts |
| **drawer** | Full height | - | Slide-out navigation drawer |
| **spacer** | 12x1 | Sizes: 1, 2, 4, 8, 12, 16 | Spacing utility for adding vertical space |
| **divider** | 12x1 | vertical/horizontal | Content separator with optional label |
| **form_section** | 12x1 | - | Groups form elements with title and description |
| **accordion** | 12x1 | single/multiple | Collapsible panels for content organization |

### 📊 Display Widgets (31 widgets)
Components for presenting information and data.

| Widget | Dimensions | Variants | Description |
|--------|------------|----------|-------------|
| **card** | 4x4, 6x4, 12x4, 12x6 | bordered, compact | Content container with title, body, and actions |
| **alert** | 12x1 | info, success, warning, error | Notification message with optional dismissal |
| **badge** | Inline | neutral, primary, secondary, accent, ghost, info, success, warning, error; sm/md/lg; outline option | Status indicator labels |
| **table** | Variable | - | Data table for structured information |
| **progress** | Variable | primary, secondary, accent, neutral, info, success, warning, error | Progress bar indicator |
| **stat** | 3x2, 4x2 | - | Statistics display with value and description |
| **steps** | 12x1 | - | Process steps indicator |
| **loading** | Inline | xs, sm, md, lg | Loading spinner animation |
| **skeleton** | 12x1 | text, card, image | Content placeholder for loading states |
| **avatar** | xs, sm, md, lg, xl | circle, square; online, offline, away, busy status | User profile image with status |
| **avatar_with_status** | xs, sm, md, lg, xl | circle, square; online, offline, away, busy | Avatar with status indicator |
| **avatar_group** | Variable | - | Multiple avatars displayed together |
| **timeline** | Variable | vertical, horizontal; compact option | Event timeline display |
| **carousel** | Variable | - | Image slider component |
| **calendar** | Variable | - | Date picker interface |
| **kbd** | Inline | sm, md, lg | Keyboard key display |
| **chat_bubble** | Variable | start, end; primary, secondary, accent | Chat message bubble |
| **rating** | Inline | xs, sm, md, lg, xl; half ratings | Star rating display |
| **breadcrumbs** | Inline | - | Navigation path indicator |
| **link** | Inline | primary, secondary, accent, neutral; hover effects | Styled hyperlink |
| **radial_progress** | Variable | sm, md, lg, xl | Circular progress indicator |
| **status_indicator** | Inline | online, offline, away, busy | Status dot indicator |
| **tooltip** | Inline | top, bottom, left, right | Hover tooltip |
| **toast** | Fixed position | info, success, warning, error | Toast notification |
| **pagination** | Inline | - | Page navigation controls |
| **widget_table** | Variable | - | Enhanced data table with columns config |
| **list** | Variable | ordered, unordered; xs, sm, md, lg sizes | List display component |
| **code_block** | Variable | Multiple language support | Syntax highlighted code display |
| **diff** | Variable | - | Code diff visualization |
| **indicator** | Inline | top, bottom, start, end, center | Position indicator overlay |
| **countdown** | Inline | - | Countdown timer display |
| **mockup_window** | Variable | - | Browser window mockup |

### 🎬 Action Widgets (8 widgets)
Interactive components for user actions.

| Widget | Dimensions | Variants | Description |
|--------|------------|----------|-------------|
| **widget_button** | 2x1 (default), configurable | primary, secondary, accent, neutral, ghost, link, info, success, warning, error; xs/sm/md/lg/xl; outline, wide, block options | Button component with multiple styles |
| **icon_button** | 1x1 | Same as widget_button; square/circle shapes | Icon-only button |
| **button_group** | Variable | - | Grouped buttons container |
| **modal** | Overlay | - | Modal dialog with title and actions |
| **dropdown** | Variable | neutral, primary, secondary, etc.; hover/click trigger | Dropdown menu |
| **swap** | Inline | rotate, flip | Toggle animation component |
| **theme_controller** | Inline | - | Theme switcher control |
| **context_menu** | Overlay | - | Right-click context menu |

### 📝 Form Widgets (18 widgets)
Input components for data collection.

| Widget | Dimensions | Variants | Description |
|--------|------------|----------|-------------|
| **text_input** | 2x1, 4x1, 6x1, 12x1 | - | Text field input |
| **email_input** | 4x1 | - | Email-specific text field |
| **password_input** | 4x1 | - | Password field with masking |
| **number_input** | 2x1 | min/max/step options | Number-specific input |
| **textarea** | 6x2, 12x2, 12x4 | Configurable rows | Multi-line text input |
| **select_input** | 4x1 | - | Dropdown select field |
| **checkbox** | Inline | primary, secondary, accent; sm/md/lg | Checkbox input |
| **toggle** | Inline | primary, secondary, accent; sm/md/lg | Toggle switch |
| **radio_group** | Variable | - | Radio button group |
| **file_input** | 6x1 | - | File upload field |
| **date_input** | 4x1 | - | Date picker field |
| **range_slider** | 6x1 | primary, secondary, accent; min/max/step | Range input slider |
| **fieldset** | Variable | - | Form group container |
| **label** | Inline | - | Form field label |
| **filter** | Variable | - | Filter control set |
| **validator** | - | - | Input validation component |
| **color_picker** | 2x1 | - | Color selection input |
| **search_input** | 6x1 | - | Search-specific input field |

### 🧭 Navigation Widgets (4 widgets)
Components for site navigation.

| Widget | Dimensions | Variants | Description |
|--------|------------|----------|-------------|
| **tabs** | 12x1 | boxed, lifted, bordered | Tab navigation interface |
| **tab_panel** | Variable | - | Content panel for tabs |
| **menu** | Variable | horizontal, vertical; compact | Navigation menu |
| **navbar** | Full width | - | Navigation bar |

## Grid System
The Lego-brick UI system uses a 12-column grid with standard widget sizes:

- **1x1**: Single unit square (icon buttons)
- **2x1**: Small horizontal (compact buttons, inputs)
- **3x2**: Small card
- **4x1**: Medium horizontal (standard inputs)
- **4x4**: Medium square (cards)
- **6x1**: Wide horizontal (search bars)
- **6x2**: Wide medium (textareas)
- **6x4**: Large card
- **12x1**: Full width single row (alerts, dividers)
- **12x2**: Full width double row
- **12x4**: Full width large (expanded cards)
- **12x6**: Full width extra large (tables, complex displays)

## Theme Support
All widgets support both Light and Dark themes with 8 color variants:
- **Primary**: Main brand color
- **Secondary**: Supporting brand color
- **Accent**: Highlight color
- **Neutral**: Default/base color
- **Info**: Informational (blue)
- **Success**: Positive feedback (green)
- **Warning**: Caution (yellow)
- **Error**: Negative feedback (red)

## Test Pages
You can see these widgets in action on the following test pages:
- `/layout-test` - Layout widgets demonstration
- `/display-test` - Display widgets showcase
- `/action-test` - Action widgets interactive demo
- `/form-test` - Form widgets with validation
- `/tabs-test` - Tabs and accordion examples
- `/avatar-test` - Avatar variations
- `/timeline-test` - Timeline layouts
- `/carousel-test` - Carousel functionality
- `/calendar-test` - Calendar widget
- `/kbd-test` - Keyboard display
- `/chat-test` - Chat bubble examples
- `/rating-test` - Rating components
- `/breadcrumbs-test` - Navigation breadcrumbs
- `/link-test` - Link styling options
- `/navigation-test` - Menu and navbar
- `/phase5-test` - Phase 5 widgets
- `/phase6-test` - Phase 6 widgets (lists, radial progress)

## Usage Example
```elixir
# In your LiveView
use SuperdupernovaWeb.Widgets

# In your template
<.card title="My Card" size="6x4" bordered={true}>
  <p>Card content goes here</p>
  <:actions>
    <.widget_button variant="primary">Action</.widget_button>
  </:actions>
</.card>
```

## Design Tokens
The system uses consistent design tokens:
- **Spacing**: 4pt system (unit, unit-2, unit-4, unit-8)
- **Border radius**: sm (0.125rem), lg (0.5rem)
- **Shadows**: sm, md, lg, neo (neomorphic)
- **Typography**: xs to 3xl sizes, weights 400-700
- **Line heights**: tight (1.25), normal (1.5), relaxed (1.75)

## Notes
- All widgets are Phoenix LiveView components
- Built with DaisyUI CSS framework
- Fully responsive and accessible
- Support for both controlled and uncontrolled states
- Comprehensive phx-click and phx-change event handling