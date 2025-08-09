defmodule SuperdupernovaWeb.ExampleLayoutLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <header class="mb-unit-8">
          <h1 class="text-4xl font-bold mb-unit-2">Example Layout - Full Horizontal Grid</h1>
          <p class="text-lg text-gray-600">
            This page demonstrates a properly implemented 12-column grid layout that takes up the full horizontal space.
          </p>
        </header>
        
        <.divider label="Full Width Examples" />
        
        <.lego_grid>
          <!-- Full width single row -->
          <div class="widget-12x1 bg-blue-100">
            <h3>Full Width (12 columns)</h3>
            <p>This widget spans all 12 columns</p>
          </div>
          
          <!-- Two equal halves -->
          <div class="widget-6x1 bg-green-100">
            <h3>Half Width Left</h3>
            <p>6 columns</p>
          </div>
          <div class="widget-6x1 bg-green-200">
            <h3>Half Width Right</h3>
            <p>6 columns</p>
          </div>
          
          <!-- Three equal thirds -->
          <div class="widget-4x1 bg-purple-100">
            <h3>Third 1</h3>
            <p>4 columns</p>
          </div>
          <div class="widget-4x1 bg-purple-200">
            <h3>Third 2</h3>
            <p>4 columns</p>
          </div>
          <div class="widget-4x1 bg-purple-300">
            <h3>Third 3</h3>
            <p>4 columns</p>
          </div>
          
          <!-- Four equal quarters -->
          <div class="widget-3x1 bg-yellow-100">
            <h3>Q1</h3>
            <p>3 cols</p>
          </div>
          <div class="widget-3x1 bg-yellow-200">
            <h3>Q2</h3>
            <p>3 cols</p>
          </div>
          <div class="widget-3x1 bg-yellow-300">
            <h3>Q3</h3>
            <p>3 cols</p>
          </div>
          <div class="widget-3x1 bg-yellow-400">
            <h3>Q4</h3>
            <p>3 cols</p>
          </div>
          
          <!-- Mixed layout example -->
          <div class="widget-8x1 bg-red-100">
            <h3>Main Content</h3>
            <p>8 columns wide</p>
          </div>
          <div class="widget-4x1 bg-red-200">
            <h3>Sidebar</h3>
            <p>4 columns</p>
          </div>
          
          <!-- Asymmetric layout -->
          <div class="widget-2x1 bg-indigo-100">
            <p>2 col</p>
          </div>
          <div class="widget-8x1 bg-indigo-200">
            <h3>Wide Center</h3>
            <p>8 columns</p>
          </div>
          <div class="widget-2x1 bg-indigo-300">
            <p>2 col</p>
          </div>
        </.lego_grid>
        
        <.spacer size="8" />
        <.divider label="Multi-Row Widget Examples" />
        
        <.lego_grid>
          <!-- Two column layout with different heights -->
          <div class="widget-6x2 bg-teal-100">
            <h3>Left Panel</h3>
            <p>This widget spans 6 columns and 2 rows</p>
            <p>Perfect for forms, content panels, or feature sections that need more vertical space</p>
          </div>
          <div class="widget-6x2 bg-teal-200">
            <h3>Right Panel</h3>
            <p>This widget also spans 6 columns and 2 rows</p>
            <p>The grid system automatically handles the vertical alignment</p>
          </div>
          
          <!-- Full width multi-row -->
          <div class="widget-12x2 bg-orange-100">
            <h3>Full Width Feature Section</h3>
            <p>This widget spans all 12 columns and 2 rows in height</p>
            <p>Ideal for hero sections, feature highlights, or any content that needs prominent display across the full width</p>
          </div>
        </.lego_grid>
        
        <.spacer size="8" />
        <.divider label="Widget Components Integration" />
        
        <.lego_grid>
          <!-- Example with actual widget components -->
          <.card title="Card Widget Example" size="4x4">
            <p>This is a card widget that properly respects the grid system.</p>
            <p class="mt-unit-2 text-sm text-gray-600">Size: 4x4</p>
          </.card>
          
          <.card title="Another Card" size="4x4">
            <p>Cards automatically handle their borders and padding.</p>
            <p class="mt-unit-2 text-sm text-gray-600">Size: 4x4</p>
          </.card>
          
          <.card title="Third Card" size="4x4">
            <p>The neobrutalist style is maintained throughout.</p>
            <p class="mt-unit-2 text-sm text-gray-600">Size: 4x4</p>
          </.card>
          
          <!-- Stats bar example -->
          <div class="widget-12x1">
            <.stat title="Total Users" value="1,234" />
          </div>
          <div class="widget-12x1">
            <.stat title="Active Sessions" value="89" />
          </div>
          <div class="widget-12x1">
            <.stat title="Conversion Rate" value="3.45%" />
          </div>
          
          <!-- Alert example -->
          <div class="widget-12x1">
            <.alert type="info">
              This alert spans the full width of the grid. The layout system ensures all widgets align properly within the 12-column grid.
            </.alert>
          </div>
        </.lego_grid>
        
        <.spacer size="8" />
        <.divider label="Responsive Behavior" />
        
        <.lego_grid>
          <div class="widget-12x1 bg-gray-100">
            <p>Note on Responsiveness:</p>
            <p>This is a desktop-first design system. The grid maintains its 12-column structure at all viewport sizes. The thin padding (px-2) ensures maximum screen utilization while the grid gap (--lego-gutter: 1rem) provides consistent spacing between widgets.</p>
          </div>
        </.lego_grid>
        
        <.spacer size="12" />
      </.lego_container>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end