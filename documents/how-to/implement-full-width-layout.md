# How to Implement Full-Width Layouts in Superdupernova

This guide explains how to properly implement layouts that utilize the full horizontal width of the viewport using the Superdupernova Lego UI system. This guide focuses **ONLY** on layout structure—widget styling is handled by `app.css` and the widget components themselves.

## Table of Contents
1. [Core Layout Structure](#core-layout-structure)
2. [The 12-Column Grid System](#the-12-column-grid-system)
3. [Widget Size Classes](#widget-size-classes)
4. [Ensuring Full Horizontal Width](#ensuring-full-horizontal-width)
5. [Common Layout Patterns](#common-layout-patterns)
6. [Troubleshooting](#troubleshooting)
7. [Complete Example](#complete-example)

---

## Core Layout Structure

Every proper full-width layout in Superdupernova follows this exact three-level hierarchy:

```heex
<div class="lego-page">
  <.lego_container>
    <.lego_grid>
      <!-- Your widgets go here -->
    </.lego_grid>
  </.lego_container>
</div>
```

### Each Level Explained:

1. **`lego-page`** (Outermost wrapper)
   - CSS class applied to a `<div>`
   - Provides full viewport height (`min-height: 100vh`)
   - Handles overflow behavior
   - **ALWAYS** the outermost element

2. **`lego_container`** (Container component)
   - Phoenix component (note the dot notation: `<.lego_container>`)
   - Provides minimal padding (px-2 py-2) for edge spacing
   - Takes full width (`w-full`)
   - **ALWAYS** wraps the grid

3. **`lego_grid`** (Grid component)
   - Phoenix component (note the dot notation: `<.lego_grid>`)
   - Creates the 12-column grid structure
   - Handles column gaps (1rem between columns)
   - **ALWAYS** contains your widgets

### CRITICAL: Never Skip Levels

❌ **WRONG** - Missing container:
```heex
<div class="lego-page">
  <.lego_grid>
    <!-- widgets -->
  </.lego_grid>
</div>
```

❌ **WRONG** - Missing page wrapper:
```heex
<.lego_container>
  <.lego_grid>
    <!-- widgets -->
  </.lego_grid>
</.lego_container>
```

✅ **CORRECT** - All three levels:
```heex
<div class="lego-page">
  <.lego_container>
    <.lego_grid>
      <!-- widgets -->
    </.lego_grid>
  </.lego_container>
</div>
```

---

## The 12-Column Grid System

The grid system divides the horizontal space into **exactly 12 columns**. Every row of widgets must sum to exactly 12 columns to fill the full width.

### Key Principles:

1. **Each row must total 12 columns**
2. **Widgets can span 1-12 columns**
3. **Widgets automatically wrap to the next row when 12 is exceeded**
4. **The grid maintains consistent gaps between columns**

### Mathematical Rule:
For any row to be full width, the sum of all widget column spans must equal 12:
- 12x1 = 12 ✅
- 6x1 + 6x1 = 12 ✅
- 4x1 + 4x1 + 4x1 = 12 ✅
- 3x1 + 3x1 + 3x1 + 3x1 = 12 ✅
- 8x1 + 4x1 = 12 ✅
- 2x1 + 8x1 + 2x1 = 12 ✅
- 2x1 + 7x1 + 3x1 = 12 ❌ (7x1 doesn't exist!)

---

## Widget Size Classes

These are the **ONLY** valid widget size classes defined in `app.css`:

### Single Row Widgets:
- `widget-1x1` - 1 column wide, 1 row tall
- `widget-2x1` - 2 columns wide, 1 row tall
- `widget-3x1` - 3 columns wide, 1 row tall
- `widget-4x1` - 4 columns wide, 1 row tall
- `widget-6x1` - 6 columns wide, 1 row tall
- `widget-8x1` - 8 columns wide, 1 row tall
- `widget-12x1` - 12 columns wide, 1 row tall (full width)

### Multi-Row Widgets:
- `widget-3x2` - 3 columns wide, 2 rows tall
- `widget-4x4` - 4 columns wide, 4 rows tall
- `widget-6x2` - 6 columns wide, 2 rows tall
- `widget-6x4` - 6 columns wide, 4 rows tall
- `widget-12x2` - 12 columns wide, 2 rows tall
- `widget-12x4` - 12 columns wide, 4 rows tall
- `widget-12x6` - 12 columns wide, 6 rows tall

### IMPORTANT: Non-Existent Classes
These classes **DO NOT EXIST** and will break your layout:
- ❌ `widget-5x1` - No 5-column span
- ❌ `widget-7x1` - No 7-column span
- ❌ `widget-9x1` - No 9-column span
- ❌ `widget-10x1` - No 10-column span
- ❌ `widget-11x1` - No 11-column span

---

## Ensuring Full Horizontal Width

### Rule 1: Always Use Valid Combinations

To achieve full width, combine widgets that sum to 12:

**Valid Full-Width Combinations:**
```heex
<!-- Single full-width widget -->
<div class="widget-12x1">...</div>

<!-- Two halves -->
<div class="widget-6x1">...</div>
<div class="widget-6x1">...</div>

<!-- Three thirds -->
<div class="widget-4x1">...</div>
<div class="widget-4x1">...</div>
<div class="widget-4x1">...</div>

<!-- Four quarters -->
<div class="widget-3x1">...</div>
<div class="widget-3x1">...</div>
<div class="widget-3x1">...</div>
<div class="widget-3x1">...</div>

<!-- Asymmetric but valid -->
<div class="widget-8x1">...</div>
<div class="widget-4x1">...</div>

<!-- Also asymmetric but valid -->
<div class="widget-2x1">...</div>
<div class="widget-8x1">...</div>
<div class="widget-2x1">...</div>
```

### Rule 2: Avoid Gaps

**❌ WRONG - Creates gap (only 11 columns):**
```heex
<div class="widget-6x1">...</div>
<div class="widget-5x1">...</div> <!-- 5x1 doesn't exist! -->
```

**❌ WRONG - Creates gap (only 10 columns):**
```heex
<div class="widget-4x1">...</div>
<div class="widget-6x1">...</div>
<!-- Missing 2 columns! -->
```

**✅ CORRECT - Full 12 columns:**
```heex
<div class="widget-4x1">...</div>
<div class="widget-6x1">...</div>
<div class="widget-2x1">...</div>
```

---

## Common Layout Patterns

### Pattern 1: Full Width Content
```heex
<.lego_grid>
  <div class="widget-12x1">
    <!-- Full width content -->
  </div>
</.lego_grid>
```

### Pattern 2: Two Column Layout
```heex
<.lego_grid>
  <div class="widget-8x1">
    <!-- Main content (2/3 width) -->
  </div>
  <div class="widget-4x1">
    <!-- Sidebar (1/3 width) -->
  </div>
</.lego_grid>
```

### Pattern 3: Three Column Layout
```heex
<.lego_grid>
  <div class="widget-3x1">
    <!-- Left sidebar -->
  </div>
  <div class="widget-6x1">
    <!-- Main content -->
  </div>
  <div class="widget-3x1">
    <!-- Right sidebar -->
  </div>
</.lego_grid>
```

### Pattern 4: Card Grid
```heex
<.lego_grid>
  <!-- Row 1 -->
  <div class="widget-4x1">Card 1</div>
  <div class="widget-4x1">Card 2</div>
  <div class="widget-4x1">Card 3</div>
  
  <!-- Row 2 -->
  <div class="widget-4x1">Card 4</div>
  <div class="widget-4x1">Card 5</div>
  <div class="widget-4x1">Card 6</div>
</.lego_grid>
```

### Pattern 5: Dashboard Layout
```heex
<.lego_grid>
  <!-- Header stats -->
  <div class="widget-3x1">Stat 1</div>
  <div class="widget-3x1">Stat 2</div>
  <div class="widget-3x1">Stat 3</div>
  <div class="widget-3x1">Stat 4</div>
  
  <!-- Main content area -->
  <div class="widget-8x4">
    <!-- Large chart or table -->
  </div>
  <div class="widget-4x4">
    <!-- Side panel -->
  </div>
  
  <!-- Footer -->
  <div class="widget-12x1">
    <!-- Full width footer -->
  </div>
</.lego_grid>
```

---

## Troubleshooting

### Problem: Row doesn't fill full width

**Symptom:** Gap on the right side of the row

**Common Causes:**
1. **Widget columns don't sum to 12**
   - Count your columns: 4 + 4 + 3 = 11 (missing 1!)
   - Solution: Add a widget-1x1 or adjust sizes

2. **Using non-existent widget classes**
   - Check for widget-5x1, widget-7x1, etc.
   - Solution: Use valid combinations from the list above

3. **Missing widget class entirely**
   - Every widget needs a widget-*x* class
   - Solution: Add the appropriate class

### Problem: Widgets overflow to next row unexpectedly

**Symptom:** Widget appears on next line when it should fit

**Cause:** Row total exceeds 12 columns
- Example: 6 + 4 + 4 = 14 (2 columns overflow!)

**Solution:** Adjust widget sizes to sum exactly to 12

### Problem: Layout breaks on certain screen sizes

**Note:** This is a desktop-first system. The 12-column grid is maintained at all sizes.

**Solution:** This is expected behavior. The grid doesn't collapse on mobile.

---

## Complete Example

Here's a complete LiveView module demonstrating proper full-width layout:

```elixir
defmodule SuperdupernovaWeb.ProperLayoutLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <!-- Header Section -->
        <.lego_grid>
          <div class="widget-12x1">
            <h1>Page Title</h1>
          </div>
        </.lego_grid>
        
        <.spacer size="4" />
        
        <!-- Two Column Section -->
        <.lego_grid>
          <div class="widget-8x1">
            <.card title="Main Content">
              <!-- Card content -->
            </.card>
          </div>
          <div class="widget-4x1">
            <.card title="Sidebar">
              <!-- Sidebar content -->
            </.card>
          </div>
        </.lego_grid>
        
        <.spacer size="4" />
        
        <!-- Three Column Section -->
        <.lego_grid>
          <div class="widget-4x1">
            <.stat title="Users" value="1,234" />
          </div>
          <div class="widget-4x1">
            <.stat title="Revenue" value="$5,678" />
          </div>
          <div class="widget-4x1">
            <.stat title="Growth" value="+23%" />
          </div>
        </.lego_grid>
        
        <.spacer size="4" />
        
        <!-- Four Column Section -->
        <.lego_grid>
          <div class="widget-3x1">
            <!-- Widget 1 -->
          </div>
          <div class="widget-3x1">
            <!-- Widget 2 -->
          </div>
          <div class="widget-3x1">
            <!-- Widget 3 -->
          </div>
          <div class="widget-3x1">
            <!-- Widget 4 -->
          </div>
        </.lego_grid>
        
        <!-- Multi-row widgets -->
        <.lego_grid>
          <div class="widget-6x2">
            <!-- Tall left widget -->
          </div>
          <div class="widget-6x2">
            <!-- Tall right widget -->
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

---

## Key Takeaways

1. **Always use the three-level structure**: lego-page → lego_container → lego_grid
2. **Every row must sum to exactly 12 columns**
3. **Only use valid widget size classes from app.css**
4. **Don't style widgets inline - let app.css handle it**
5. **Test your math: count columns in each row**
6. **Use spacers and dividers between grid sections for visual separation**

## Reference Implementation

See `/test/example-layout` for a working example that demonstrates all these principles.

---

## DO NOT:
- ❌ Add custom CSS for widths
- ❌ Use Tailwind width classes (w-1/2, w-full, etc.) on widgets
- ❌ Create new widget size classes
- ❌ Skip any of the three layout levels
- ❌ Add padding, margins, or borders inline
- ❌ Use flexbox or custom grid classes

## ALWAYS:
- ✅ Use the three-level structure
- ✅ Ensure rows sum to 12
- ✅ Use only defined widget classes
- ✅ Let app.css handle styling
- ✅ Use widget components when available
- ✅ Test your layout visually