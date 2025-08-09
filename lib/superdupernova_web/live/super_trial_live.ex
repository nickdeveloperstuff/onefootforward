defmodule SuperdupernovaWeb.SuperTrialLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <!-- Header Section -->
        <.lego_grid>
          <div class="widget-12x1">
            <h1>Super Trial - Full Width Layout</h1>
            <p>This page demonstrates a proper full-width layout using the Superdupernova Lego UI system.</p>
          </div>
        </.lego_grid>
        
        <.spacer size="4" />
        
        <!-- Stats Row - Four columns -->
        <.lego_grid>
          <div class="widget-3x1">
            <.stat title="Total Users" value="10,234" />
          </div>
          <div class="widget-3x1">
            <.stat title="Active Sessions" value="1,456" />
          </div>
          <div class="widget-3x1">
            <.stat title="Revenue" value="$45,678" />
          </div>
          <div class="widget-3x1">
            <.stat title="Growth Rate" value="+34%" />
          </div>
        </.lego_grid>
        
        <.spacer size="4" />
        
        <!-- Two Column Section -->
        <.lego_grid>
          <div class="widget-8x1">
            <.card title="Main Content Area">
              <p>This is the main content area taking up 8 columns (2/3 of the width).</p>
              <p>The layout automatically maintains proper spacing and alignment.</p>
              <p>This demonstrates the two-column layout pattern from the documentation.</p>
            </.card>
          </div>
          <div class="widget-4x1">
            <.card title="Sidebar">
              <p>This sidebar takes up 4 columns (1/3 of the width).</p>
              <p>Together with the main content, it fills the full 12-column grid.</p>
            </.card>
          </div>
        </.lego_grid>
        
        <.spacer size="4" />
        
        <!-- Three Column Section -->
        <.lego_grid>
          <div class="widget-4x1">
            <.card title="Feature 1">
              <p>First feature card in a three-column layout.</p>
            </.card>
          </div>
          <div class="widget-4x1">
            <.card title="Feature 2">
              <p>Second feature card in a three-column layout.</p>
            </.card>
          </div>
          <div class="widget-4x1">
            <.card title="Feature 3">
              <p>Third feature card in a three-column layout.</p>
            </.card>
          </div>
        </.lego_grid>
        
        <.spacer size="4" />
        
        <!-- Multi-row widgets example -->
        <.lego_grid>
          <div class="widget-6x2">
            <.card title="Large Widget Left">
              <p>This is a 6x2 widget (6 columns wide, 2 rows tall).</p>
              <p>It demonstrates the use of multi-row widgets.</p>
              <p>Perfect for charts, graphs, or more complex content.</p>
            </.card>
          </div>
          <div class="widget-6x2">
            <.card title="Large Widget Right">
              <p>Another 6x2 widget to balance the layout.</p>
              <p>Together they fill the full 12-column width.</p>
              <p>The height is automatically managed by the grid system.</p>
            </.card>
          </div>
        </.lego_grid>
        
        <.spacer size="4" />
        
        <!-- Full Width Footer -->
        <.lego_grid>
          <div class="widget-12x1">
            <.card title="Full Width Footer">
              <p>This footer demonstrates a full-width widget using widget-12x1.</p>
              <p>It spans all 12 columns of the grid system.</p>
            </.card>
          </div>
        </.lego_grid>
        
        <.spacer size="4" />
        
        <!-- Asymmetric Layout Example -->
        <.lego_grid>
          <div class="widget-2x1">
            <.stat title="Small" value="100" />
          </div>
          <div class="widget-8x1">
            <.card title="Wide Center Content">
              <p>This demonstrates an asymmetric layout: 2 + 8 + 2 = 12 columns.</p>
            </.card>
          </div>
          <div class="widget-2x1">
            <.stat title="Small" value="200" />
          </div>
        </.lego_grid>
      </.lego_container>
    </div>
    """
  end
end