# Widget Styling Guidelines

## Design Token Compliance

All widgets in the Superdupernova UI system inherit their styling from the centralized design token system defined in `app.css`. This ensures consistency across the entire application.

## Core Design Tokens

### Spacing Units (4pt Atomic System)
- `--lego-unit`: 0.25rem (4px) - Base unit
- `--lego-unit-2`: 0.5rem (8px)
- `--lego-unit-3`: 0.75rem (12px)
- `--lego-unit-4`: 1rem (16px) - Standard gutter
- `--lego-unit-6`: 1.5rem (24px)
- `--lego-unit-8`: 2rem (32px)
- `--lego-unit-12`: 3rem (48px)
- `--lego-unit-16`: 4rem (64px)

### Visual Design
- `--border-width`: 2px (Neobrutalist style)
- `--border-color`: black
- `--shadow-offset`: 0.25rem
- `--transition-duration`: 150ms

## Widget Categories

### Fully Compliant Widgets
These widgets inherit ALL styling from app.css design tokens:

#### Layout Widgets
- `lego_container` - Uses grid system tokens
- `lego_grid` - 12-column grid with `--lego-gutter`
- `drawer` - Border tokens for slide-out panel
- `spacer` - Uses spacing unit tokens
- `divider` - Border color token

#### Display Widgets
- `card` - Border, padding, and transition tokens
- `alert` - Border and padding tokens
- `badge` - Border and padding tokens
- `table` - Border and padding tokens
- `progress` - Border and height tokens
- `stat` - Border and padding tokens
- `tooltip` - Border and padding tokens
- `toast` - Inherits from alert styling

#### Action Widgets
- `widget_button` - Border, padding, hover effects
- `modal` - Border and padding tokens
- `dropdown` - Border and padding tokens

#### Form Widgets
- All input types - Border, padding, focus states
- `checkbox` / `radio` - Size and border tokens
- `toggle` - Size and border tokens

## Special Cases

### Widgets with Unique Requirements

1. **Avatar**: Uses predefined size classes but maintains border tokens
2. **Carousel**: Container sizing uses grid tokens, navigation is custom
3. **Calendar**: Grid-based layout with token spacing
4. **Rating**: Uses custom star/heart icons but maintains spacing
5. **Theme Controller**: System-level component with special handling

### SVG-Based Components
These widgets use inline SVG but still respect spacing tokens:
- Loading spinners
- Icon buttons
- Status indicators
- Chat typing indicators

## Adding New Widgets

When creating new widgets:

1. **Always use design tokens** for:
   - Spacing (padding, margins, gaps)
   - Borders (width, color)
   - Transitions
   - Typography sizes

2. **Never hardcode**:
   - Pixel values
   - Color values (use theme colors)
   - Border widths

3. **Test compliance** by:
   - Checking computed styles in browser
   - Verifying token inheritance
   - Testing theme switching

## Exceptions

The following are acceptable exceptions:

1. **Icon sizes**: When icons must maintain aspect ratios
2. **Animation keyframes**: For complex animations
3. **Third-party integrations**: When external libraries require specific styles
4. **Accessibility features**: When WCAG compliance requires specific values

## Testing Checklist

For each widget:
- [ ] Uses CSS variables for all spacing
- [ ] Uses border tokens for all borders
- [ ] Respects transition duration
- [ ] Works with both light and dark themes
- [ ] Maintains neobrutalist aesthetic
- [ ] No hardcoded colors or dimensions

## Maintenance

Review this document quarterly to ensure:
- All new widgets are documented
- Design tokens are up to date
- Special cases are justified
- Testing procedures are current