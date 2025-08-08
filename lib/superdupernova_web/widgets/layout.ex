defmodule SuperdupernovaWeb.Widgets.Layout do
  use Phoenix.Component
  
  @doc """
  Container widget for consistent page layout
  """
  attr :class, :string, default: ""
  slot :inner_block, required: true

  def lego_container(assigns) do
    ~H"""
    <div class={"lego-container #{@class}"}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  @doc """
  Grid widget for layout
  """
  attr :class, :string, default: ""
  slot :inner_block, required: true

  def lego_grid(assigns) do
    ~H"""
    <div class={"lego-grid #{@class}"}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  @doc """
  Tabs widget for tabbed interfaces
  """
  attr :active_tab, :atom, required: true
  attr :tabs, :list, required: true
  
  slot :inner_block, required: true

  def tabs(assigns) do
    ~H"""
    <div class="widget-12x1">
      <div role="tablist" class="tabs tabs-boxed">
        <%= for {id, label} <- @tabs do %>
          <a 
            role="tab" 
            class={"tab #{if @active_tab == id, do: "tab-active"}"}
            phx-click="switch_tab"
            phx-value-tab={id}
          >
            <%= label %>
          </a>
        <% end %>
      </div>
      <div class="mt-4">
        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end

  @doc """
  Tab panel - shows content for specific tab
  """
  attr :tab, :atom, required: true
  attr :active_tab, :atom, required: true
  
  slot :inner_block, required: true

  def tab_panel(assigns) do
    ~H"""
    <div class={if @tab == @active_tab, do: "block", else: "hidden"}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  @doc """
  Divider widget for visual separation
  """
  attr :label, :string, default: nil
  attr :vertical, :boolean, default: false

  def divider(assigns) do
    ~H"""
    <div class={if @vertical, do: "divider divider-horizontal", else: "widget-12x1 divider"}>
      <%= @label %>
    </div>
    """
  end

  @doc """
  Spacer widget for adding space
  """
  attr :size, :string, default: "1", values: ["1", "2", "4", "8", "12", "16"]

  def spacer(assigns) do
    ~H"""
    <div class={"h-unit-#{@size} widget-12x1"}></div>
    """
  end

  @doc """
  Form section widget for grouping form elements
  """
  attr :title, :string, required: true
  attr :description, :string, default: nil
  
  slot :inner_block, required: true

  def form_section(assigns) do
    ~H"""
    <div class="widget-12x1 mb-unit-8">
      <h3 class="text-lg font-semibold mb-unit-2"><%= @title %></h3>
      <%= if @description do %>
        <p class="text-sm opacity-70 mb-unit-4"><%= @description %></p>
      <% end %>
      <div class="grid grid-cols-12 gap-lego">
        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end

  @doc """
  Accordion widget for collapsible content
  """
  attr :items, :list, required: true
  attr :multiple, :boolean, default: false

  def accordion(assigns) do
    ~H"""
    <div class="widget-12x1">
      <%= for {id, title, content} <- @items do %>
        <div class="collapse collapse-arrow bg-base-200 mb-2">
          <input 
            type={if @multiple, do: "checkbox", else: "radio"} 
            name="accordion-group"
            id={"accordion-#{id}"}
          /> 
          <label for={"accordion-#{id}"} class="collapse-title text-lg font-medium">
            <%= title %>
          </label>
          <div class="collapse-content"> 
            <p><%= content %></p>
          </div>
        </div>
      <% end %>
    </div>
    """
  end

  @doc """
  Drawer widget for slide-out panels
  """
  attr :id, :string, required: true
  attr :side, :string, default: "left", values: ["left", "right"]
  slot :toggle, required: true
  slot :content, required: true
  slot :main, required: true

  def drawer(assigns) do
    ~H"""
    <div class="drawer">
      <input id={@id} type="checkbox" class="drawer-toggle" />
      <div class="drawer-content">
        <!-- Page content -->
        <%= render_slot(@main) %>
        <!-- Toggle button -->
        <label for={@id} class="drawer-button btn btn-primary">
          <%= render_slot(@toggle) %>
        </label>
      </div> 
      <div class="drawer-side">
        <label for={@id} class="drawer-overlay"></label>
        <div class={"menu p-4 w-80 min-h-full bg-base-200 text-base-content"}>
          <!-- Sidebar content -->
          <%= render_slot(@content) %>
        </div>
      </div>
    </div>
    """
  end

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

  @doc """
  Navbar widget for top navigation bar
  """
  attr :class, :string, default: ""
  slot :start
  slot :center
  slot :end_slot

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
      
      <%= if @end_slot != [] do %>
        <div class="navbar-end">
          <%= render_slot(@end_slot) %>
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
      
      <:end_slot>
        <%= if @actions != [] do %>
          <%= render_slot(@actions) %>
        <% end %>
      </:end_slot>
    </.navbar>
    """
  end

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

  @doc """
  Styled link component
  """
  attr :href, :string, default: nil
  attr :navigate, :string, default: nil
  attr :variant, :string, default: "primary", values: ["primary", "secondary", "accent", "ghost", "link", "info", "success", "warning", "error"]
  attr :underline, :string, default: "hover", values: ["always", "hover", "none"]
  attr :class, :string, default: ""
  slot :inner_block, required: true

  def styled_link(assigns) do
    ~H"""
    <%= if @href do %>
      <a href={@href} class={link_class(@variant, @underline, @class)}>
        <%= render_slot(@inner_block) %>
      </a>
    <% else %>
      <%= if @navigate do %>
        <.link navigate={@navigate} class={link_class(@variant, @underline, @class)}>
          <%= render_slot(@inner_block) %>
        </.link>
      <% else %>
        <span class={link_class(@variant, @underline, @class)}>
          <%= render_slot(@inner_block) %>
        </span>
      <% end %>
    <% end %>
    """
  end

  defp link_class(variant, underline, custom_class) do
    base = "link"
    variant_class = "link-#{variant}"
    underline_class = case underline do
      "always" -> "underline-offset-4 underline"
      "hover" -> "link-hover"
      "none" -> "no-underline"
      _ -> ""
    end
    
    [base, variant_class, underline_class, custom_class]
    |> Enum.filter(&(&1 != ""))
    |> Enum.join(" ")
  end

  @doc """
  Button link component
  """
  attr :href, :string, default: nil
  attr :navigate, :string, default: nil
  attr :variant, :string, default: "primary"
  attr :size, :string, default: "md", values: ["xs", "sm", "md", "lg"]
  attr :outline, :boolean, default: false
  attr :class, :string, default: ""
  slot :inner_block, required: true

  def button_link(assigns) do
    ~H"""
    <%= if @href do %>
      <a href={@href} class={button_link_class(@variant, @size, @outline, @class)}>
        <%= render_slot(@inner_block) %>
      </a>
    <% else %>
      <%= if @navigate do %>
        <.link navigate={@navigate} class={button_link_class(@variant, @size, @outline, @class)}>
          <%= render_slot(@inner_block) %>
        </.link>
      <% else %>
        <span class={button_link_class(@variant, @size, @outline, @class)}>
          <%= render_slot(@inner_block) %>
        </span>
      <% end %>
    <% end %>
    """
  end

  defp button_link_class(variant, size, outline, custom_class) do
    base = "btn"
    variant_class = if outline, do: "btn-outline btn-#{variant}", else: "btn-#{variant}"
    size_class = "btn-#{size}"
    
    [base, variant_class, size_class, custom_class]
    |> Enum.filter(&(&1 != ""))
    |> Enum.join(" ")
  end
end