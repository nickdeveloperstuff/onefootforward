defmodule SuperdupernovaWeb.BreadcrumbsTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets
  alias SuperdupernovaWeb.Widgets.Layout
  import SuperdupernovaWeb.Widgets.Layout

  def mount(_params, _session, socket) do
    {:ok, assign(socket, current_path: "/products/electronics/laptops")}
  end

  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-2xl font-bold mb-unit-4">Breadcrumbs Widget Test Page</h1>
        
        <h2 class="text-xl font-semibold mb-unit-2">Basic Breadcrumbs</h2>
        <.lego_grid>
          <div class="widget-12x1">
            <Layout.breadcrumbs items={[
              %{label: "Home", href: "/"},
              %{label: "Products", href: "/products"},
              %{label: "Electronics", href: "/products/electronics"},
              %{label: "Laptops", href: "/products/electronics/laptops"}
            ]} />
          </div>
        </.lego_grid>

        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">Breadcrumbs with LiveView Navigation</h2>
        <.lego_grid>
          <div class="widget-12x1">
            <Layout.breadcrumbs items={[
              %{label: "Home", navigate: "/"},
              %{label: "Dashboard", navigate: "/dashboard"},
              %{label: "Settings", navigate: "/dashboard/settings"},
              %{label: "Profile"}
            ]} />
          </div>
        </.lego_grid>

        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">Breadcrumbs with Icons</h2>
        <.lego_grid>
          <div class="widget-12x2">
            <Layout.breadcrumbs_with_icons items={[
              %{label: "Home", href: "/", icon: ~s(<svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" viewBox="0 0 20 20" fill="currentColor"><path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" /></svg>)},
              %{label: "Documents", href: "/docs", icon: ~s(<svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" viewBox="0 0 20 20" fill="currentColor"><path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" /><path fill-rule="evenodd" d="M4 5a2 2 0 012-2 1 1 0 000 2H6a2 2 0 100 4H6a1 1 0 100 2h-.01A2 2 0 106 15H6a1 1 0 100-2H6a2 2 0 100-4h-.01a2 2 0 01-2-2V5zm9 1a2 2 0 100 4h1a1 1 0 110 2h-1a2 2 0 100 4h1a1 1 0 110 2h-1a2 2 0 10-2-2V6a2 2 0 012-2z" clip-rule="evenodd" /></svg>)},
              %{label: "Reports", icon: ~s(<svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" viewBox="0 0 20 20" fill="currentColor"><path fill-rule="evenodd" d="M3 3a1 1 0 000 2v8a2 2 0 002 2h2.586l-1.293 1.293a1 1 0 101.414 1.414L10 15.414l2.293 2.293a1 1 0 001.414-1.414L12.414 15H15a2 2 0 002-2V5a1 1 0 100-2H3zm11.707 4.293a1 1 0 00-1.414 0L10 10.586 8.707 9.293a1 1 0 00-1.414 0l-2 2a1 1 0 101.414 1.414L8 11.414l1.293 1.293a1 1 0 001.414 0l4-4a1 1 0 000-1.414z" clip-rule="evenodd" /></svg>)}
            ]}>
              <:home_icon>
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
                  <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
                </svg>
              </:home_icon>
            </Layout.breadcrumbs_with_icons>
          </div>
        </.lego_grid>

        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">Dynamic Breadcrumbs from Path</h2>
        <.lego_grid>
          <div class="widget-12x1">
            <p class="text-sm text-gray-600 mb-2">Path: <%= @current_path %></p>
            <Layout.breadcrumbs items={breadcrumbs_from_path(@current_path)} />
          </div>
        </.lego_grid>

        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">Mixed Navigation Types</h2>
        <.lego_grid>
          <div class="widget-12x1">
            <Layout.breadcrumbs items={[
              %{label: "Home", href: "/"},
              %{label: "Dashboard", navigate: "/dashboard"},
              %{label: "Analytics", href: "/analytics"},
              %{label: "Current Page"}
            ]} />
          </div>
        </.lego_grid>
      </.lego_container>
    </div>
    """
  end
end