defmodule SuperdupernovaWeb.LayoutTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.drawer id="main-drawer">
        <:toggle>
          Open Drawer
        </:toggle>
        
        <:content>
          <h2 class="text-xl font-bold mb-4">Drawer Menu</h2>
          <ul class="menu">
            <li><a>Dashboard</a></li>
            <li><a>Profile</a></li>
            <li><a>Settings</a></li>
            <li><a>Reports</a></li>
            <li><a>Analytics</a></li>
            <li><a>Documentation</a></li>
            <li><a>Support</a></li>
            <li><a>Logout</a></li>
          </ul>
        </:content>
        
        <:main>
          <.lego_container>
            <h1 class="text-2xl font-bold mb-unit-4">Layout Widgets Test</h1>
            
            <p class="mb-4">
              This page demonstrates the drawer widget. Click the "Open Drawer" button above to see the slide-out navigation menu.
            </p>
            
            <.divider label="Additional Content" />
            
            <.lego_grid>
              <div class="widget-12x1">
                <p>The drawer widget provides a slide-out panel that can contain navigation menus, forms, or any other content. It's perfect for mobile-responsive navigation or secondary content that doesn't need to be visible all the time.</p>
              </div>
            </.lego_grid>
            
            <.spacer size="4" />
            
            <.lego_grid>
              <.card title="Main Content Area" size="12x4">
                This is the main content area. The drawer overlays this content when opened.
                The drawer can be toggled by clicking the button or by clicking the overlay when open.
              </.card>
            </.lego_grid>
          </.lego_container>
        </:main>
      </.drawer>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end