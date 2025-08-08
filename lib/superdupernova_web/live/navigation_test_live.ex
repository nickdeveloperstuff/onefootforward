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