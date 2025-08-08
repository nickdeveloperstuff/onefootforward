defmodule SuperdupernovaWeb.Widgets.Display do
  use Phoenix.Component
  import Phoenix.HTML

  @doc """
  Card widget for content display
  """
  attr :title, :string, required: true
  attr :size, :string, default: "6x4", values: ["4x4", "6x4", "12x4", "12x6"]
  attr :bordered, :boolean, default: true
  attr :compact, :boolean, default: false
  attr :image_url, :string, default: nil
  
  slot :actions
  slot :inner_block, required: true

  def card(assigns) do
    ~H"""
    <div class={grid_size_class(@size)}>
      <div class={card_classes(@bordered, @compact)}>
        <%= if @image_url do %>
          <figure>
            <img src={@image_url} alt={@title} />
          </figure>
        <% end %>
        <div class="card-body">
          <h2 class="card-title"><%= @title %></h2>
          <div class="card-content">
            <%= render_slot(@inner_block) %>
          </div>
          <%= if @actions != [] do %>
            <div class="card-actions justify-end">
              <%= render_slot(@actions) %>
            </div>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  defp card_classes(bordered, compact) do
    base = "card bg-base-100 h-full shadow-sm"
    border = if bordered, do: "card-bordered", else: ""
    compact_class = if compact, do: "card-compact", else: ""
    
    [base, border, compact_class]
    |> Enum.filter(&(&1 != ""))
    |> Enum.join(" ")
  end

  @doc """
  Alert widget for notifications
  """
  attr :type, :string, default: "info", 
    values: ["info", "success", "warning", "error"]
  attr :title, :string, default: nil
  attr :dismissible, :boolean, default: false
  
  slot :inner_block, required: true

  def alert(assigns) do
    ~H"""
    <div class="widget-12x1">
      <div class={"alert alert-#{@type}"} role="alert">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" 
          class="stroke-current shrink-0 w-6 h-6">
          <%= raw(alert_icon(@type)) %>
        </svg>
        <div>
          <%= if @title do %>
            <h3 class="font-bold"><%= @title %></h3>
          <% end %>
          <div class="text-sm"><%= render_slot(@inner_block) %></div>
        </div>
        <%= if @dismissible do %>
          <button class="btn btn-sm btn-ghost" phx-click={Phoenix.LiveView.JS.hide(to: ".alert")}>✕</button>
        <% end %>
      </div>
    </div>
    """
  end

  @doc """
  Badge widget for labels and tags
  """
  attr :variant, :string, default: "neutral",
    values: ["neutral", "primary", "secondary", "accent", "ghost", "info", "success", "warning", "error"]
  attr :outline, :boolean, default: false
  attr :size, :string, default: "md", values: ["sm", "md", "lg"]
  
  slot :inner_block, required: true

  def badge(assigns) do
    ~H"""
    <span class={badge_classes(@variant, @size, @outline)}>
      <%= render_slot(@inner_block) %>
    </span>
    """
  end

  defp alert_icon("info") do
    ~s(<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>)
  end

  defp alert_icon("success") do
    ~s(<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>)
  end

  defp alert_icon("warning") do
    ~s(<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path>)
  end

  defp alert_icon("error") do
    ~s(<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path>)
  end

  defp badge_classes(variant, size, outline) do
    base = "badge"
    variant_class = if outline, do: "badge-outline badge-#{variant}", else: "badge-#{variant}"
    size_class = "badge-#{size}"
    
    [base, variant_class, size_class]
    |> Enum.filter(&(&1 != ""))
    |> Enum.join(" ")
  end

  @doc """
  Table widget for tabular data
  """
  attr :data, :list, required: true
  attr :columns, :list, required: true
  attr :striped, :boolean, default: true
  attr :hover, :boolean, default: true
  attr :compact, :boolean, default: false

  def widget_table(assigns) do
    table_class = [
      "table",
      assigns.striped && "table-zebra",
      assigns.hover && "table-hover", 
      assigns.compact && "table-compact"
    ]
    |> Enum.filter(& &1)
    |> Enum.join(" ")
    
    assigns = assign(assigns, :table_class, table_class)
    
    ~H"""
    <div class="widget-12x1 overflow-x-auto">
      <table class={@table_class}>
        <thead>
          <tr>
            <%= for col <- @columns do %>
              <th><%= col.label %></th>
            <% end %>
          </tr>
        </thead>
        <tbody>
          <%= for row <- @data do %>
            <tr>
              <%= for col <- @columns do %>
                <td><%= Map.get(row, col.key) %></td>
              <% end %>
            </tr>
          <% end %>
        </tbody>
      </table>
    </div>
    """
  end

  @doc """
  Progress bar widget
  """
  attr :value, :integer, required: true
  attr :max, :integer, default: 100
  attr :variant, :string, default: "primary"
  attr :size, :string, default: "4x1"

  def progress(assigns) do
    ~H"""
    <div class={grid_size_class(@size)}>
      <progress class={"progress progress-#{@variant}"} value={@value} max={@max}>
        <%= @value %>%
      </progress>
    </div>
    """
  end

  @doc """
  Stat widget for metrics display
  """
  attr :title, :string, required: true
  attr :value, :string, required: true
  attr :desc, :string, default: nil
  attr :size, :string, default: "3x2"

  def stat(assigns) do
    ~H"""
    <div class={grid_size_class(@size)}>
      <div class="stat bg-base-100 rounded-lg shadow-sm">
        <div class="stat-title"><%= @title %></div>
        <div class="stat-value"><%= @value %></div>
        <%= if @desc do %>
          <div class="stat-desc"><%= @desc %></div>
        <% end %>
      </div>
    </div>
    """
  end

  @doc """
  Steps widget for progress indication
  """
  attr :steps, :list, required: true
  attr :current_step, :integer, default: 0

  def steps(assigns) do
    ~H"""
    <div class="widget-12x1">
      <ul class="steps w-full">
        <%= for {step, index} <- Enum.with_index(@steps) do %>
          <li class={step_class(index, @current_step)}>
            <%= step %>
          </li>
        <% end %>
      </ul>
    </div>
    """
  end

  defp step_class(index, current) when index < current, do: "step step-primary"
  defp step_class(index, current) when index == current, do: "step step-primary"
  defp step_class(_, _), do: "step"

  @doc """
  Loading spinner widget
  """
  attr :size, :string, default: "md", values: ["xs", "sm", "md", "lg"]
  attr :variant, :string, default: "spinner"

  def loading(assigns) do
    ~H"""
    <span class={"loading loading-#{@variant} loading-#{@size}"}></span>
    """
  end

  @doc """
  Skeleton loader widget
  """
  attr :type, :string, default: "text", values: ["text", "card", "image"]
  attr :lines, :integer, default: 3

  def skeleton(assigns) do
    ~H"""
    <div class="widget-12x1">
      <%= case @type do %>
        <% "text" -> %>
          <%= for _ <- 1..@lines do %>
            <div class="skeleton h-4 w-full mb-2"></div>
          <% end %>
        <% "card" -> %>
          <div class="skeleton h-32 w-full mb-4"></div>
          <div class="skeleton h-4 w-28 mb-2"></div>
          <div class="skeleton h-4 w-full mb-2"></div>
          <div class="skeleton h-4 w-full"></div>
        <% "image" -> %>
          <div class="skeleton h-48 w-full"></div>
      <% end %>
    </div>
    """
  end

  defp grid_size_class("3x2"), do: "widget-4x1"
  defp grid_size_class("4x4"), do: "widget-4x1"
  defp grid_size_class("6x4"), do: "widget-6x1"
  defp grid_size_class("12x4"), do: "widget-12x1"
  defp grid_size_class("12x6"), do: "widget-12x1"
  defp grid_size_class(_), do: "widget-6x1"

  @doc """
  Avatar widget for user profile images with status indicators
  """
  attr :src, :string, default: nil
  attr :alt, :string, default: "Avatar"
  attr :size, :string, default: "md", values: ["xs", "sm", "md", "lg", "xl"]
  attr :shape, :string, default: "circle", values: ["circle", "square"]
  attr :status, :string, default: nil, values: [nil, "online", "offline", "away", "busy"]
  attr :placeholder, :string, default: nil
  slot :inner_block

  def avatar(assigns) do
    ~H"""
    <div class={avatar_container_class(@size)}>
      <div class={avatar_class(@status)}>
        <div class={avatar_size_class(@size, @shape)}>
          <%= if @src do %>
            <img src={@src} alt={@alt} />
          <% else %>
            <%= if @placeholder do %>
              <span class="text-3xl"><%= @placeholder %></span>
            <% else %>
              <%= render_slot(@inner_block) %>
            <% end %>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  defp avatar_container_class(size) do
    case size do
      "xs" -> "avatar-xs"
      "sm" -> "avatar-sm"
      "md" -> "avatar"
      "lg" -> "avatar-lg"
      "xl" -> "avatar-xl"
      _ -> "avatar"
    end
  end

  defp avatar_class(nil), do: "avatar"
  defp avatar_class(status), do: "avatar #{status}"

  defp avatar_size_class(size, shape) do
    base = case size do
      "xs" -> "w-8 h-8"
      "sm" -> "w-12 h-12"
      "md" -> "w-16 h-16"
      "lg" -> "w-20 h-20"
      "xl" -> "w-24 h-24"
      _ -> "w-16 h-16"
    end
    
    shape_class = case shape do
      "square" -> "rounded-lg"
      _ -> "rounded-full"
    end
    
    "#{base} #{shape_class}"
  end

  @doc """
  Avatar with status indicator
  """
  attr :show_status, :boolean, default: false
  attr :src, :string, default: nil
  attr :alt, :string, default: "Avatar"
  attr :size, :string, default: "md", values: ["xs", "sm", "md", "lg", "xl"]
  attr :shape, :string, default: "circle", values: ["circle", "square"]
  attr :status, :string, default: nil, values: [nil, "online", "offline", "away", "busy"]
  attr :placeholder, :string, default: nil
  slot :inner_block

  def avatar_with_status(assigns) do
    ~H"""
    <div class="avatar-group">
      <div class={avatar_with_indicator_class(@status)}>
        <div class={avatar_size_class(@size, @shape)}>
          <%= if @src do %>
            <img src={@src} alt={@alt} />
          <% else %>
            <div class="bg-neutral-focus text-neutral-content">
              <%= @placeholder || render_slot(@inner_block) %>
            </div>
          <% end %>
        </div>
        <%= if @show_status && @status do %>
          <span class={status_indicator_class(@status)}></span>
        <% end %>
      </div>
    </div>
    """
  end

  defp avatar_with_indicator_class(status) do
    case status do
      "online" -> "avatar online"
      "offline" -> "avatar offline"
      "away" -> "avatar away"
      "busy" -> "avatar busy"
      _ -> "avatar"
    end
  end

  defp status_indicator_class(status) do
    case status do
      "online" -> "badge badge-success badge-xs absolute -bottom-1 -right-1"
      "offline" -> "badge badge-ghost badge-xs absolute -bottom-1 -right-1"
      "away" -> "badge badge-warning badge-xs absolute -bottom-1 -right-1"
      "busy" -> "badge badge-error badge-xs absolute -bottom-1 -right-1"
      _ -> ""
    end
  end

  @doc """
  Avatar group for displaying multiple avatars
  """
  attr :max_display, :integer, default: 3
  slot :avatars, required: true

  def avatar_group(assigns) do
    ~H"""
    <div class="avatar-group -space-x-6">
      <%= for {avatar, index} <- Enum.with_index(@avatars) do %>
        <%= if index < @max_display do %>
          <%= render_slot(avatar) %>
        <% end %>
      <% end %>
      <%= if length(@avatars) > @max_display do %>
        <div class="avatar placeholder">
          <div class="w-12 bg-neutral-focus text-neutral-content">
            <span>+<%= length(@avatars) - @max_display %></span>
          </div>
        </div>
      <% end %>
    </div>
    """
  end

  @doc """
  Timeline widget for displaying chronological events
  """
  attr :vertical, :boolean, default: true
  attr :size, :string, default: "md", values: ["xs", "sm", "md", "lg"]
  attr :compact, :boolean, default: false
  slot :items, required: true

  def timeline(assigns) do
    ~H"""
    <ul class={timeline_class(@vertical, @compact)}>
      <%= for item <- @items do %>
        <%= render_slot(item) %>
      <% end %>
    </ul>
    """
  end

  defp timeline_class(vertical, compact) do
    base = "timeline"
    vertical_class = if vertical, do: "timeline-vertical", else: ""
    compact_class = if compact, do: "timeline-compact", else: ""
    
    [base, vertical_class, compact_class]
    |> Enum.filter(&(&1 != ""))
    |> Enum.join(" ")
  end

  @doc """
  Timeline item component for individual timeline entries
  """
  attr :title, :string, required: true
  attr :content, :string, default: nil
  attr :time, :string, default: nil
  attr :icon, :string, default: nil
  attr :status, :string, default: nil, values: [nil, "primary", "secondary", "accent", "success", "warning", "error", "info"]
  attr :start_item, :boolean, default: false
  attr :end_item, :boolean, default: false
  slot :inner_block

  def timeline_item(assigns) do
    ~H"""
    <li>
      <%= if @start_item do %>
        <hr />
      <% end %>
      
      <div class={timeline_item_class(@status)}>
        <%= if @icon do %>
          <div class="timeline-icon">
            <i class={@icon}></i>
          </div>
        <% else %>
          <svg class="timeline-icon" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd" />
          </svg>
        <% end %>
      </div>
      
      <div class="timeline-middle">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="h-5 w-5">
          <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd" />
        </svg>
      </div>
      
      <div class="timeline-end mb-10">
        <%= if @time do %>
          <time class="font-mono italic"><%= @time %></time>
        <% end %>
        <div class="text-lg font-black"><%= @title %></div>
        <%= if @content do %>
          <p><%= @content %></p>
        <% end %>
        <%= render_slot(@inner_block) %>
      </div>
      
      <%= if @end_item do %>
        <hr />
      <% end %>
    </li>
    """
  end

  defp timeline_item_class(nil), do: "timeline-start"
  defp timeline_item_class(status), do: "timeline-start timeline-box timeline-#{status}"

  @doc """
  Timeline variant with alternating sides
  """
  attr :items, :list, required: true
  attr :compact, :boolean, default: false

  def timeline_alternating(assigns) do
    ~H"""
    <ul class={timeline_alternating_class(@compact)}>
      <%= for {item, index} <- Enum.with_index(@items) do %>
        <li>
          <%= if index > 0 do %>
            <hr />
          <% end %>
          
          <%= if rem(index, 2) == 0 do %>
            <div class="timeline-start timeline-box">
              <%= if item[:time] do %>
                <time class="font-mono italic"><%= item[:time] %></time>
              <% end %>
              <div class="text-lg font-black"><%= item[:title] %></div>
              <%= if item[:content] do %>
                <p><%= item[:content] %></p>
              <% end %>
            </div>
          <% end %>
          
          <div class="timeline-middle">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="h-5 w-5">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd" />
            </svg>
          </div>
          
          <%= if rem(index, 2) == 1 do %>
            <div class="timeline-end timeline-box">
              <%= if item[:time] do %>
                <time class="font-mono italic"><%= item[:time] %></time>
              <% end %>
              <div class="text-lg font-black"><%= item[:title] %></div>
              <%= if item[:content] do %>
                <p><%= item[:content] %></p>
              <% end %>
            </div>
          <% else %>
            <div class="timeline-end"></div>
          <% end %>
          
          <%= if index == length(@items) - 1 do %>
            <hr />
          <% end %>
        </li>
      <% end %>
    </ul>
    """
  end

  defp timeline_alternating_class(compact) do
    base = "timeline timeline-snap-icon max-md:timeline-compact timeline-vertical"
    compact_class = if compact, do: "timeline-compact", else: ""
    
    [base, compact_class]
    |> Enum.filter(&(&1 != ""))
    |> Enum.join(" ")
  end

  @doc """
  Carousel widget for image/content sliding display
  """
  attr :id, :string, required: true
  attr :items, :list, default: []
  attr :show_indicators, :boolean, default: true
  attr :show_controls, :boolean, default: true
  attr :width, :string, default: "full", values: ["full", "half", "auto"]
  attr :aspect_ratio, :string, default: "16:9", values: ["16:9", "4:3", "1:1", "21:9"]
  slot :slides, required: false

  def carousel(assigns) do
    ~H"""
    <div class={carousel_container_class(@width, @aspect_ratio)}>
      <div class="carousel w-full">
        <%= if @slides != [] do %>
          <%= for {slide, index} <- Enum.with_index(@slides) do %>
            <div id={"#{@id}-slide-#{index}"} class="carousel-item relative w-full">
              <%= render_slot(slide) %>
              <%= if @show_controls do %>
                <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                  <a href={"##{@id}-slide-#{if index == 0, do: length(@slides) - 1, else: index - 1}"} class="btn btn-circle">❮</a>
                  <a href={"##{@id}-slide-#{if index == length(@slides) - 1, do: 0, else: index + 1}"} class="btn btn-circle">❯</a>
                </div>
              <% end %>
            </div>
          <% end %>
        <% else %>
          <%= for {item, index} <- Enum.with_index(@items) do %>
            <div id={"#{@id}-slide-#{index}"} class="carousel-item relative w-full">
              <%= if is_map(item) && Map.has_key?(item, :image) do %>
                <img src={item.image} class="w-full" alt={Map.get(item, :alt, "")} />
              <% else %>
                <div class="w-full flex items-center justify-center">
                  <%= item %>
                </div>
              <% end %>
              <%= if @show_controls do %>
                <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                  <a href={"##{@id}-slide-#{if index == 0, do: length(@items) - 1, else: index - 1}"} class="btn btn-circle">❮</a>
                  <a href={"##{@id}-slide-#{if index == length(@items) - 1, do: 0, else: index + 1}"} class="btn btn-circle">❯</a>
                </div>
              <% end %>
            </div>
          <% end %>
        <% end %>
      </div>
      <%= if @show_indicators do %>
        <div class="flex justify-center w-full py-2 gap-2">
          <%= for index <- 0..(if @slides != [], do: length(@slides) - 1, else: length(@items) - 1) do %>
            <a href={"##{@id}-slide-#{index}"} class="btn btn-xs">
              <%= index + 1 %>
            </a>
          <% end %>
        </div>
      <% end %>
    </div>
    """
  end

  defp carousel_container_class(width, aspect_ratio) do
    width_class = case width do
      "half" -> "w-1/2"
      "auto" -> "w-auto"
      _ -> "w-full"
    end
    
    aspect_class = case aspect_ratio do
      "4:3" -> "aspect-4/3"
      "1:1" -> "aspect-square"
      "21:9" -> "aspect-[21/9]"
      _ -> "aspect-video"
    end
    
    "#{width_class} #{aspect_class}"
  end

  @doc """
  Carousel with navigation dots
  """
  attr :id, :string, required: true
  attr :slides, :list, required: true
  attr :auto_play, :boolean, default: false
  attr :interval, :integer, default: 5000

  def carousel_with_dots(assigns) do
    ~H"""
    <div id={"#{@id}-container"} class="relative w-full" data-interval={@interval}>
      <div class="carousel carousel-center w-full">
        <%= for {slide, index} <- Enum.with_index(@slides) do %>
          <div id={"#{@id}-item-#{index}"} class="carousel-item w-full">
            <%= if is_map(slide) && Map.has_key?(slide, :content) do %>
              <%= slide.content %>
            <% else %>
              <%= slide %>
            <% end %>
          </div>
        <% end %>
      </div>
      <div class="flex justify-center w-full py-2 gap-2">
        <%= for index <- 0..(length(@slides) - 1) do %>
          <button 
            phx-click="carousel_goto"
            phx-value-carousel={@id}
            phx-value-index={index}
            class={carousel_dot_class(index, 0)}
          >
          </button>
        <% end %>
      </div>
    </div>
    """
  end

  defp carousel_dot_class(index, current) do
    base = "w-3 h-3 rounded-full transition-colors"
    if index == current do
      "#{base} bg-primary"
    else
      "#{base} bg-base-300 hover:bg-base-content/50"
    end
  end

  @doc """
  Carousel with thumbnails navigation
  """
  attr :id, :string, required: true
  attr :images, :list, required: true
  attr :show_thumbnails, :boolean, default: true

  def carousel_with_thumbnails(assigns) do
    ~H"""
    <div class="space-y-4">
      <div class="carousel w-full">
        <%= for {image, index} <- Enum.with_index(@images) do %>
          <div id={"#{@id}-main-#{index}"} class="carousel-item relative w-full">
            <img src={image.url} class="w-full" alt={image.alt || ""} />
            <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
              <a href={"##{@id}-main-#{if index == 0, do: length(@images) - 1, else: index - 1}"} class="btn btn-circle btn-sm">❮</a>
              <a href={"##{@id}-main-#{if index == length(@images) - 1, do: 0, else: index + 1}"} class="btn btn-circle btn-sm">❯</a>
            </div>
          </div>
        <% end %>
      </div>
      
      <%= if @show_thumbnails do %>
        <div class="carousel carousel-center max-w-full space-x-2 p-2 bg-base-200 rounded-box">
          <%= for {image, index} <- Enum.with_index(@images) do %>
            <div class="carousel-item">
              <a href={"##{@id}-main-#{index}"} class="block">
                <img src={image.url} class="h-20 rounded" alt={image.alt || ""} />
              </a>
            </div>
          <% end %>
        </div>
      <% end %>
    </div>
    """
  end

  @doc """
  Calendar widget for date selection and display
  """
  attr :selected_date, :any, default: nil
  attr :month, :integer, default: nil
  attr :year, :integer, default: nil
  attr :show_nav, :boolean, default: true
  attr :size, :string, default: "md", values: ["sm", "md", "lg"]
  attr :disabled_dates, :list, default: []
  attr :highlighted_dates, :list, default: []
  attr :on_select, :any, default: nil

  def calendar(assigns) do
    current_date = Date.utc_today()
    month = assigns[:month] || current_date.month
    year = assigns[:year] || current_date.year
    
    first_day = Date.new!(year, month, 1)
    _last_day = Date.end_of_month(first_day)
    days_in_month = Date.days_in_month(first_day)
    
    # Get the day of week for the first day (0 = Sunday, 6 = Saturday)
    first_dow = Date.day_of_week(first_day, :sunday)
    
    # Calculate padding days from previous month
    padding_start = rem(first_dow - 1 + 7, 7)
    
    # Generate calendar days with padding
    calendar_days = generate_calendar_days(first_day, days_in_month, padding_start)
    
    assigns = 
      assigns
      |> assign(:month, month)
      |> assign(:year, year)
      |> assign(:calendar_days, calendar_days)
      |> assign(:current_date, current_date)
      |> assign(:first_day, first_day)
    
    ~H"""
    <div class={calendar_container_class(@size)}>
      <%= if @show_nav do %>
        <div class="flex justify-between items-center mb-4">
          <button phx-click="prev_month" class="btn btn-sm btn-ghost">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
              <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
            </svg>
          </button>
          <div class="text-lg font-semibold">
            <%= Calendar.strftime(@first_day, "%B %Y") %>
          </div>
          <button phx-click="next_month" class="btn btn-sm btn-ghost">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
              <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
            </svg>
          </button>
        </div>
      <% end %>
      
      <div class="grid grid-cols-7 gap-1">
        <!-- Day headers -->
        <%= for day_name <- ~w(Sun Mon Tue Wed Thu Fri Sat) do %>
          <div class={calendar_header_class(@size)}>
            <%= day_name %>
          </div>
        <% end %>
        
        <!-- Calendar days -->
        <%= for day <- @calendar_days do %>
          <div 
            class={calendar_day_class(day, @selected_date, @current_date, @disabled_dates, @highlighted_dates, @size)}
            phx-click={if day.current_month && !Enum.member?(@disabled_dates, day.date), do: @on_select || "select_date"}
            phx-value-date={if day.current_month, do: Date.to_iso8601(day.date)}
          >
            <%= if day.current_month do %>
              <%= day.day %>
            <% end %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  defp generate_calendar_days(first_day, days_in_month, padding_start) do
    # Previous month padding
    prev_month_days = for _i <- 1..padding_start do
      %{current_month: false, day: nil, date: nil}
    end
    
    # Current month days
    current_month_days = for day <- 1..days_in_month do
      date = Date.add(first_day, day - 1)
      %{current_month: true, day: day, date: date}
    end
    
    # Next month padding to complete the grid
    total_cells = length(prev_month_days) + length(current_month_days)
    remaining_cells = 
      cond do
        rem(total_cells, 7) == 0 -> 0
        true -> 7 - rem(total_cells, 7)
      end
    
    next_month_days = for _i <- 1..remaining_cells do
      %{current_month: false, day: nil, date: nil}
    end
    
    prev_month_days ++ current_month_days ++ next_month_days
  end

  defp calendar_container_class("sm"), do: "w-64"
  defp calendar_container_class("lg"), do: "w-96"
  defp calendar_container_class(_), do: "w-80"

  defp calendar_header_class("sm"), do: "text-xs text-center font-semibold p-1"
  defp calendar_header_class("lg"), do: "text-base text-center font-semibold p-3"
  defp calendar_header_class(_), do: "text-sm text-center font-semibold p-2"

  defp calendar_day_class(day, selected_date, current_date, disabled_dates, highlighted_dates, size) do
    base_class = case size do
      "sm" -> "p-1 text-xs"
      "lg" -> "p-3 text-base"
      _ -> "p-2 text-sm"
    end
    
    cond do
      !day.current_month ->
        "#{base_class} invisible"
      
      day.date && Enum.member?(disabled_dates, day.date) ->
        "#{base_class} text-center rounded cursor-not-allowed opacity-50 bg-base-200"
      
      day.date && selected_date && Date.compare(day.date, selected_date) == :eq ->
        "#{base_class} text-center rounded cursor-pointer bg-primary text-primary-content"
      
      day.date && Date.compare(day.date, current_date) == :eq ->
        "#{base_class} text-center rounded cursor-pointer bg-accent text-accent-content"
      
      day.date && Enum.member?(highlighted_dates, day.date) ->
        "#{base_class} text-center rounded cursor-pointer bg-secondary text-secondary-content hover:bg-secondary-focus"
      
      true ->
        "#{base_class} text-center rounded cursor-pointer hover:bg-base-200"
    end
  end

  @doc """
  Date picker widget with calendar dropdown
  """
  attr :value, :any, default: nil
  attr :format, :string, default: "%Y-%m-%d"
  attr :placeholder, :string, default: "Select date"
  attr :size, :string, default: "md", values: ["sm", "md", "lg"]
  attr :disabled, :boolean, default: false
  attr :on_change, :any, default: nil

  def date_picker(assigns) do
    ~H"""
    <div class="relative">
      <input 
        type="text" 
        class={date_picker_input_class(@size, @disabled)}
        value={if @value, do: Calendar.strftime(@value, @format), else: ""}
        placeholder={@placeholder}
        readonly
        phx-click="toggle_date_picker"
        disabled={@disabled}
      />
      <div class="absolute right-2 top-1/2 -translate-y-1/2 pointer-events-none">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
          <path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 012.25-2.25h13.5A2.25 2.25 0 0121 7.5v11.25m-18 0A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75m-18 0v-7.5A2.25 2.25 0 015.25 9h13.5A2.25 2.25 0 0121 11.25v7.5" />
        </svg>
      </div>
    </div>
    """
  end

  @doc """
  Keyboard key display widget for showing keyboard shortcuts
  """
  attr :keys, :list, default: []
  attr :key, :string, default: nil
  attr :size, :string, default: "md", values: ["xs", "sm", "md", "lg"]
  attr :theme, :string, default: "default", values: ["default", "dark", "light"]
  slot :inner_block

  def kbd(assigns) do
    keys = if assigns.key, do: [assigns.key], else: assigns.keys
    assigns = assign(assigns, :keys_list, keys)
    
    ~H"""
    <span class={kbd_container_class()}>
      <%= if @keys_list != [] do %>
        <%= for {key, index} <- Enum.with_index(@keys_list) do %>
          <%= if index > 0 do %>
            <span class="text-base-content/50 mx-1">+</span>
          <% end %>
          <kbd class={kbd_class(@size, @theme)}>
            <%= format_key(key) %>
          </kbd>
        <% end %>
      <% else %>
        <kbd class={kbd_class(@size, @theme)}>
          <%= render_slot(@inner_block) %>
        </kbd>
      <% end %>
    </span>
    """
  end

  defp kbd_container_class do
    "inline-flex items-center"
  end

  defp kbd_class(size, theme) do
    base = "kbd"
    size_class = case size do
      "xs" -> "kbd-xs"
      "sm" -> "kbd-sm"
      "lg" -> "kbd-lg"
      _ -> ""
    end
    
    theme_class = case theme do
      "dark" -> "bg-neutral text-neutral-content"
      "light" -> "bg-base-200 text-base-content"
      _ -> ""
    end
    
    [base, size_class, theme_class]
    |> Enum.filter(&(&1 != ""))
    |> Enum.join(" ")
  end

  defp format_key(key) do
    case String.downcase(key) do
      "cmd" -> "⌘"
      "command" -> "⌘"
      "ctrl" -> "Ctrl"
      "control" -> "Ctrl"
      "alt" -> "Alt"
      "option" -> "⌥"
      "shift" -> "⇧"
      "tab" -> "⇥"
      "enter" -> "↵"
      "return" -> "↵"
      "backspace" -> "⌫"
      "delete" -> "⌦"
      "escape" -> "Esc"
      "esc" -> "Esc"
      "space" -> "␣"
      "up" -> "↑"
      "down" -> "↓"
      "left" -> "←"
      "right" -> "→"
      "pageup" -> "PgUp"
      "pagedown" -> "PgDn"
      "home" -> "Home"
      "end" -> "End"
      _ -> key
    end
  end

  @doc """
  Keyboard shortcut group display
  """
  attr :shortcuts, :list, required: true
  attr :title, :string, default: nil
  attr :layout, :string, default: "list", values: ["list", "grid", "inline"]

  def kbd_shortcuts(assigns) do
    ~H"""
    <div class={kbd_shortcuts_container_class(@layout)}>
      <%= if @title do %>
        <h3 class="text-lg font-semibold mb-2"><%= @title %></h3>
      <% end %>
      <div class={kbd_shortcuts_layout_class(@layout)}>
        <%= for {description, keys} <- @shortcuts do %>
          <div class={kbd_shortcut_item_class(@layout)}>
            <span class="text-sm"><%= description %></span>
            <.kbd keys={keys} size="sm" />
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  defp kbd_shortcuts_container_class(_layout) do
    "w-full"
  end

  defp kbd_shortcuts_layout_class("grid") do
    "grid grid-cols-2 gap-4"
  end

  defp kbd_shortcuts_layout_class("inline") do
    "flex flex-wrap gap-4"
  end

  defp kbd_shortcuts_layout_class(_) do
    "space-y-2"
  end

  defp kbd_shortcut_item_class("inline") do
    "flex items-center gap-2"
  end

  defp kbd_shortcut_item_class(_) do
    "flex justify-between items-center"
  end

  defp date_picker_input_class(size, disabled) do
    base = "input input-bordered w-full pr-10"
    size_class = case size do
      "sm" -> "input-sm"
      "lg" -> "input-lg"
      _ -> ""
    end
    disabled_class = if disabled, do: "input-disabled", else: ""
    
    [base, size_class, disabled_class]
    |> Enum.filter(&(&1 != ""))
    |> Enum.join(" ")
  end

  @doc """
  Radial progress widget for circular progress indication
  """
  attr :value, :integer, required: true
  attr :size, :string, default: "md", values: ["xs", "sm", "md", "lg", "xl"]
  attr :variant, :string, default: "primary", values: ["primary", "secondary", "accent", "info", "success", "warning", "error", "neutral"]
  attr :show_value, :boolean, default: true
  attr :thickness, :string, default: "4", values: ["2", "4", "6", "8", "10"]
  attr :max, :integer, default: 100

  def radial_progress(assigns) do
    percentage = min(100, round(assigns.value / assigns.max * 100))
    assigns = assign(assigns, :percentage, percentage)
    
    ~H"""
    <div class={radial_progress_container_class(@size)}>
      <div 
        class={radial_progress_class(@variant, @size)}
        style={"--value:#{@percentage}; --thickness: #{@thickness}px;"}
        role="progressbar"
        aria-valuenow={@percentage}
        aria-valuemin="0"
        aria-valuemax="100"
      >
        <%= if @show_value do %>
          <span class={radial_progress_text_class(@size)}><%= @percentage %>%</span>
        <% end %>
      </div>
    </div>
    """
  end

  defp radial_progress_container_class(size) do
    case size do
      "xs" -> "w-12 h-12"
      "sm" -> "w-16 h-16"
      "md" -> "w-20 h-20"
      "lg" -> "w-24 h-24"
      "xl" -> "w-32 h-32"
      _ -> "w-20 h-20"
    end
  end

  defp radial_progress_class(variant, size) do
    base = "radial-progress"
    variant_class = "text-#{variant}"
    size_specific = case size do
      "xs" -> "w-12 h-12"
      "sm" -> "w-16 h-16"
      "md" -> "w-20 h-20"
      "lg" -> "w-24 h-24"
      "xl" -> "w-32 h-32"
      _ -> "w-20 h-20"
    end
    
    [base, variant_class, size_specific]
    |> Enum.filter(&(&1 != ""))
    |> Enum.join(" ")
  end

  defp radial_progress_text_class(size) do
    case size do
      "xs" -> "text-xs"
      "sm" -> "text-sm"
      "md" -> "text-base"
      "lg" -> "text-lg"
      "xl" -> "text-xl"
      _ -> "text-base"
    end
  end

  @doc """
  List widget for displaying organized content
  """
  attr :items, :list, required: true
  attr :type, :string, default: "unordered", values: ["unordered", "ordered", "menu", "steps"]
  attr :size, :string, default: "md", values: ["xs", "sm", "md", "lg"]
  attr :dense, :boolean, default: false
  attr :hover, :boolean, default: false
  slot :item_template

  def list(assigns) do
    ~H"""
    <%= case @type do %>
      <% "menu" -> %>
        <ul class={list_menu_class(@size, @dense, @hover)}>
          <%= for item <- @items do %>
            <li>
              <%= if @item_template != [] do %>
                <%= render_slot(@item_template, item) %>
              <% else %>
                <a><%= item %></a>
              <% end %>
            </li>
          <% end %>
        </ul>
      <% "steps" -> %>
        <ul class="steps steps-vertical">
          <%= for item <- @items do %>
            <li class={if Map.get(item, :completed, false), do: "step step-primary", else: "step"}>
              <%= Map.get(item, :label, item) %>
            </li>
          <% end %>
        </ul>
      <% "ordered" -> %>
        <ol class={list_class(@size, @dense)}>
          <%= for {item, index} <- Enum.with_index(@items, 1) do %>
            <li>
              <span class="font-semibold mr-2"><%= index %>.</span>
              <%= if @item_template != [] do %>
                <%= render_slot(@item_template, item) %>
              <% else %>
                <%= item %>
              <% end %>
            </li>
          <% end %>
        </ol>
      <% _ -> %>
        <ul class={list_class(@size, @dense)}>
          <%= for item <- @items do %>
            <li class="flex items-start">
              <span class="mr-2">•</span>
              <span>
                <%= if @item_template != [] do %>
                  <%= render_slot(@item_template, item) %>
                <% else %>
                  <%= item %>
                <% end %>
              </span>
            </li>
          <% end %>
        </ul>
    <% end %>
    """
  end

  defp list_class(size, dense) do
    base = "list"
    size_class = case size do
      "xs" -> "text-xs"
      "sm" -> "text-sm"
      "lg" -> "text-lg"
      _ -> "text-base"
    end
    spacing = if dense, do: "space-y-1", else: "space-y-2"
    
    [base, size_class, spacing]
    |> Enum.filter(&(&1 != ""))
    |> Enum.join(" ")
  end

  defp list_menu_class(size, dense, hover) do
    base = "menu bg-base-200 rounded-box"
    size_class = case size do
      "xs" -> "menu-xs"
      "sm" -> "menu-sm"
      "lg" -> "menu-lg"
      _ -> ""
    end
    dense_class = if dense, do: "menu-compact", else: ""
    hover_class = if hover, do: "[&_li>*]:hover:bg-base-300", else: ""
    
    [base, size_class, dense_class, hover_class]
    |> Enum.filter(&(&1 != ""))
    |> Enum.join(" ")
  end

  @doc """
  Status indicator widget for showing system or item states
  """
  attr :status, :string, required: true, values: ["online", "offline", "busy", "away", "active", "inactive", "pending", "error", "success", "warning"]
  attr :label, :string, default: nil
  attr :size, :string, default: "md", values: ["xs", "sm", "md", "lg"]
  attr :pulse, :boolean, default: false
  attr :with_dot, :boolean, default: true

  def status_indicator(assigns) do
    ~H"""
    <div class={status_indicator_container_class(@size)}>
      <%= if @with_dot do %>
        <div class={status_indicator_dot_class(@status, @size, @pulse)}></div>
      <% end %>
      <%= if @label do %>
        <span class={status_indicator_label_class(@size)}>
          <%= @label %>
        </span>
      <% else %>
        <span class={status_indicator_label_class(@size)}>
          <%= humanize_status(@status) %>
        </span>
      <% end %>
    </div>
    """
  end

  defp status_indicator_container_class(size) do
    base = "inline-flex items-center gap-2"
    size_specific = case size do
      "xs" -> "text-xs"
      "sm" -> "text-sm"
      "lg" -> "text-lg"
      _ -> "text-base"
    end
    
    [base, size_specific]
    |> Enum.join(" ")
  end

  defp status_indicator_dot_class(status, size, pulse) do
    base = "rounded-full"
    
    size_class = case size do
      "xs" -> "w-2 h-2"
      "sm" -> "w-2.5 h-2.5"
      "md" -> "w-3 h-3"
      "lg" -> "w-4 h-4"
      _ -> "w-3 h-3"
    end
    
    {color_class, should_pulse} = case status do
      "online" -> {"bg-success", pulse}
      "active" -> {"bg-success", pulse}
      "success" -> {"bg-success", false}
      "offline" -> {"bg-base-300", false}
      "inactive" -> {"bg-base-300", false}
      "busy" -> {"bg-error", pulse}
      "error" -> {"bg-error", pulse}
      "away" -> {"bg-warning", false}
      "warning" -> {"bg-warning", pulse}
      "pending" -> {"bg-info animate-pulse", true}
      _ -> {"bg-neutral", false}
    end
    
    pulse_class = if should_pulse, do: "animate-pulse", else: ""
    
    [base, size_class, color_class, pulse_class]
    |> Enum.filter(&(&1 != ""))
    |> Enum.join(" ")
  end

  defp status_indicator_label_class(size) do
    case size do
      "xs" -> "text-xs"
      "sm" -> "text-sm"
      "lg" -> "text-lg font-medium"
      _ -> "text-base"
    end
  end

  defp humanize_status(status) do
    status
    |> String.capitalize()
    |> String.replace("_", " ")
  end

  @doc """
  Tooltip widget for displaying hover information
  """
  attr :text, :string, required: true
  attr :position, :string, default: "top", values: ["top", "bottom", "left", "right"]
  attr :color, :string, default: "neutral", values: ["neutral", "primary", "secondary", "accent", "info", "success", "warning", "error"]
  attr :force_open, :boolean, default: false
  slot :inner_block, required: true

  def tooltip(assigns) do
    ~H"""
    <div class={tooltip_class(@position, @color, @force_open)} data-tip={@text}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  defp tooltip_class(position, color, force_open) do
    base = "tooltip"
    position_class = "tooltip-#{position}"
    color_class = "tooltip-#{color}"
    open_class = if force_open, do: "tooltip-open", else: ""
    
    [base, position_class, color_class, open_class]
    |> Enum.filter(&(&1 != ""))
    |> Enum.join(" ")
  end

  @doc """
  Advanced tooltip with more positioning options
  """
  attr :text, :string, required: true
  attr :position, :string, default: "top"
  attr :align, :string, default: "center", values: ["start", "center", "end"]
  attr :delay, :integer, default: 0
  attr :width, :string, default: "auto"
  slot :inner_block, required: true

  def tooltip_advanced(assigns) do
    ~H"""
    <div 
      class={tooltip_advanced_class(@position, @align)}
      data-tip={@text}
      style={"--tooltip-delay: #{@delay}ms; --tooltip-width: #{@width};"}
    >
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  defp tooltip_advanced_class(position, _align) do
    base = "tooltip"
    position_class = case position do
      "top-start" -> "tooltip-top tooltip-start"
      "top-end" -> "tooltip-top tooltip-end"
      "bottom-start" -> "tooltip-bottom tooltip-start"
      "bottom-end" -> "tooltip-bottom tooltip-end"
      "left-start" -> "tooltip-left tooltip-start"
      "left-end" -> "tooltip-left tooltip-end"
      "right-start" -> "tooltip-right tooltip-start"
      "right-end" -> "tooltip-right tooltip-end"
      pos -> "tooltip-#{pos}"
    end
    
    "#{base} #{position_class}"
  end

  @doc """
  Toast container for notification display
  """
  attr :position, :string, default: "top-end", values: ["top-start", "top-center", "top-end", "bottom-start", "bottom-center", "bottom-end", "middle-start", "middle-center", "middle-end"]
  slot :toasts

  def toast_container(assigns) do
    ~H"""
    <div class={toast_container_class(@position)}>
      <%= render_slot(@toasts) %>
    </div>
    """
  end

  defp toast_container_class(position) do
    base = "toast"
    position_classes = case position do
      "top-start" -> "toast-top toast-start"
      "top-center" -> "toast-top toast-center"
      "top-end" -> "toast-top toast-end"
      "bottom-start" -> "toast-bottom toast-start"
      "bottom-center" -> "toast-bottom toast-center"
      "bottom-end" -> "toast-bottom toast-end"
      "middle-start" -> "toast-middle toast-start"
      "middle-center" -> "toast-middle toast-center"
      "middle-end" -> "toast-middle toast-end"
      _ -> "toast-top toast-end"
    end
    
    "#{base} #{position_classes}"
  end

  @doc """
  Individual toast notification
  """
  attr :id, :string, required: true
  attr :type, :string, default: "info", values: ["info", "success", "warning", "error"]
  attr :title, :string, default: nil
  attr :message, :string, required: true
  attr :duration, :integer, default: 5000
  attr :closable, :boolean, default: true

  def toast(assigns) do
    ~H"""
    <div id={@id} class={toast_alert_class(@type)} phx-hook="ToastHook" data-duration={@duration}>
      <div class="flex">
        <%= Phoenix.HTML.raw(toast_icon(@type)) %>
        <div class="flex-1">
          <%= if @title do %>
            <h3 class="font-bold"><%= @title %></h3>
          <% end %>
          <div class="text-sm"><%= @message %></div>
        </div>
        <%= if @closable do %>
          <button class="btn btn-ghost btn-xs" phx-click={Phoenix.LiveView.JS.hide(to: "##{@id}")}>
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        <% end %>
      </div>
    </div>
    """
  end

  defp toast_alert_class(type) do
    base = "alert"
    type_class = "alert-#{type}"
    "#{base} #{type_class}"
  end

  defp toast_icon("info") do
    """
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="stroke-info shrink-0 w-6 h-6">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
    </svg>
    """
  end

  defp toast_icon("success") do
    """
    <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
    </svg>
    """
  end

  defp toast_icon("warning") do
    """
    <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
    </svg>
    """
  end

  defp toast_icon("error") do
    """
    <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
    </svg>
    """
  end

  @doc """
  Chat bubble widget for messaging interfaces
  """
  attr :message, :string, required: true
  attr :sender, :string, default: "user"
  attr :time, :string, default: nil
  attr :avatar, :string, default: nil
  attr :align, :string, default: "start", values: ["start", "end"]
  attr :color, :string, default: "primary", values: ["primary", "secondary", "accent", "info", "success", "warning", "error", "neutral"]
  slot :actions

  def chat_bubble(assigns) do
    ~H"""
    <div class={chat_bubble_container_class(@align)}>
      <%= if @avatar do %>
        <div class="chat-image avatar">
          <div class="w-10 rounded-full">
            <img src={@avatar} alt={@sender} />
          </div>
        </div>
      <% end %>
      <div class="chat-header">
        <%= @sender %>
        <%= if @time do %>
          <time class="text-xs opacity-50"><%= @time %></time>
        <% end %>
      </div>
      <div class={chat_bubble_class(@color)}>
        <%= @message %>
      </div>
      <%= if @actions != [] do %>
        <div class="chat-footer opacity-50">
          <%= render_slot(@actions) %>
        </div>
      <% end %>
    </div>
    """
  end

  defp chat_bubble_container_class("end"), do: "chat chat-end"
  defp chat_bubble_container_class(_), do: "chat chat-start"

  defp chat_bubble_class(color) do
    "chat-bubble chat-bubble-#{color}"
  end

  @doc """
  Chat conversation container
  """
  attr :messages, :list, required: true
  attr :show_typing, :boolean, default: false
  attr :current_user, :string, default: "You"

  def chat_conversation(assigns) do
    ~H"""
    <div class="w-full space-y-2 p-4">
      <%= for message <- @messages do %>
        <.chat_bubble
          message={message.text}
          sender={message.sender}
          time={message.time}
          avatar={Map.get(message, :avatar)}
          align={if message.sender == @current_user, do: "end", else: "start"}
          color={if message.sender == @current_user, do: "primary", else: "secondary"}
        />
      <% end %>
      <%= if @show_typing do %>
        <.chat_typing_indicator />
      <% end %>
    </div>
    """
  end

  @doc """
  Chat typing indicator
  """
  def chat_typing_indicator(assigns) do
    ~H"""
    <div class="chat chat-start">
      <div class="chat-bubble">
        <span class="loading loading-dots loading-sm"></span>
      </div>
    </div>
    """
  end

  @doc """
  Chat input component
  """
  attr :placeholder, :string, default: "Type a message..."
  attr :on_send, :string, default: "send_message"
  attr :disabled, :boolean, default: false

  def chat_input(assigns) do
    ~H"""
    <div class="flex gap-2 p-4 border-t">
      <input 
        type="text" 
        placeholder={@placeholder}
        class="input input-bordered flex-1"
        disabled={@disabled}
        phx-keyup={@on_send}
        phx-key="Enter"
      />
      <button 
        class="btn btn-primary"
        phx-click={@on_send}
        disabled={@disabled}
      >
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
          <path stroke-linecap="round" stroke-linejoin="round" d="M6 12L3.269 3.126A59.768 59.768 0 0121.485 12 59.77 59.77 0 013.27 20.876L5.999 12zm0 0h7.5" />
        </svg>
      </button>
    </div>
    """
  end

  @doc """
  Rating widget for user feedback
  """
  attr :value, :integer, default: 0
  attr :max, :integer, default: 5
  attr :size, :string, default: "md", values: ["xs", "sm", "md", "lg", "xl"]
  attr :readonly, :boolean, default: false
  attr :half, :boolean, default: false
  attr :on_change, :string, default: nil
  attr :color, :string, default: "warning", values: ["primary", "secondary", "accent", "info", "success", "warning", "error"]

  def rating(assigns) do
    ~H"""
    <div class={rating_container_class(@size, @half)}>
      <%= for i <- 1..@max do %>
        <input 
          type="radio" 
          name={"rating-#{System.unique_integer()}"} 
          class={rating_input_class(@size, @color, @half)}
          checked={i == @value}
          disabled={@readonly}
          phx-click={@on_change}
          phx-value-rating={i}
        />
      <% end %>
    </div>
    """
  end

  defp rating_container_class(size, half) do
    base = "rating"
    size_class = "rating-#{size}"
    half_class = if half, do: "rating-half", else: ""
    
    [base, size_class, half_class]
    |> Enum.filter(&(&1 != ""))
    |> Enum.join(" ")
  end

  defp rating_input_class(size, color, half) do
    base = "mask mask-star-2"
    color_class = "bg-#{color}"
    half_class = if half, do: "mask-half-1", else: ""
    
    [base, color_class, half_class]
    |> Enum.filter(&(&1 != ""))
    |> Enum.join(" ")
  end

  @doc """
  Interactive rating with labels
  """
  attr :value, :integer, default: 0
  attr :max, :integer, default: 5
  attr :labels, :list, default: ["Poor", "Fair", "Good", "Very Good", "Excellent"]
  attr :on_change, :string, default: "rate"
  attr :show_value, :boolean, default: true

  def rating_with_labels(assigns) do
    ~H"""
    <div class="flex flex-col items-center gap-2">
      <.rating 
        value={@value} 
        max={@max}
        on_change={@on_change}
      />
      <%= if @show_value && @value > 0 do %>
        <div class="text-sm font-medium">
          <%= Enum.at(@labels, @value - 1, "") %>
        </div>
      <% end %>
    </div>
    """
  end

  @doc """
  Heart rating variant
  """
  attr :value, :integer, default: 0
  attr :max, :integer, default: 5
  attr :size, :string, default: "md"
  attr :readonly, :boolean, default: false
  attr :on_change, :string, default: nil

  def rating_hearts(assigns) do
    ~H"""
    <div class={"rating gap-1 rating-#{@size}"}>
      <%= for i <- 1..@max do %>
        <input 
          type="radio" 
          name={"rating-heart-#{System.unique_integer()}"} 
          class="mask mask-heart bg-red-400"
          checked={i == @value}
          disabled={@readonly}
          phx-click={@on_change}
          phx-value-rating={i}
        />
      <% end %>
    </div>
    """
  end

  @doc """
  Pagination widget for navigating through pages
  """
  attr :current_page, :integer, required: true
  attr :total_pages, :integer, required: true
  attr :on_page_change, :string, default: "change_page"
  attr :show_prev_next, :boolean, default: true
  attr :show_first_last, :boolean, default: false
  attr :max_buttons, :integer, default: 7

  def pagination(assigns) do
    assigns = assign(assigns, :page_numbers, calculate_page_numbers(assigns))
    
    ~H"""
    <div class="join">
      <%= if @show_first_last && @current_page > 1 do %>
        <button class="join-item btn" phx-click={@on_page_change} phx-value-page="1">
          «
        </button>
      <% end %>
      
      <%= if @show_prev_next && @current_page > 1 do %>
        <button class="join-item btn" phx-click={@on_page_change} phx-value-page={@current_page - 1}>
          ‹
        </button>
      <% end %>
      
      <%= for page <- @page_numbers do %>
        <%= if page == "..." do %>
          <button class="join-item btn btn-disabled">...</button>
        <% else %>
          <button 
            class={pagination_button_class(page, @current_page)}
            phx-click={@on_page_change} 
            phx-value-page={page}
          >
            <%= page %>
          </button>
        <% end %>
      <% end %>
      
      <%= if @show_prev_next && @current_page < @total_pages do %>
        <button class="join-item btn" phx-click={@on_page_change} phx-value-page={@current_page + 1}>
          ›
        </button>
      <% end %>
      
      <%= if @show_first_last && @current_page < @total_pages do %>
        <button class="join-item btn" phx-click={@on_page_change} phx-value-page={@total_pages}>
          »
        </button>
      <% end %>
    </div>
    """
  end

  defp pagination_button_class(page, current_page) when page == current_page do
    "join-item btn btn-active"
  end

  defp pagination_button_class(_page, _current_page) do
    "join-item btn"
  end

  defp calculate_page_numbers(%{current_page: current, total_pages: total, max_buttons: max}) do
    cond do
      total <= max ->
        Enum.to_list(1..total)
      
      current <= div(max, 2) + 1 ->
        Enum.to_list(1..(max - 2)) ++ ["...", total]
      
      current >= total - div(max, 2) ->
        [1, "..."] ++ Enum.to_list((total - max + 3)..total)
      
      true ->
        half = div(max - 3, 2)
        [1, "..."] ++ Enum.to_list((current - half)..(current + half)) ++ ["...", total]
    end
  end

  @doc """
  Advanced pagination with page size selector
  """
  attr :current_page, :integer, required: true
  attr :total_items, :integer, required: true
  attr :page_size, :integer, default: 10
  attr :page_sizes, :list, default: [10, 25, 50, 100]
  attr :on_page_change, :string, default: "change_page"
  attr :on_page_size_change, :string, default: "change_page_size"

  def pagination_with_size(assigns) do
    total_pages = ceil(assigns.total_items / assigns.page_size)
    assigns = assign(assigns, :total_pages, total_pages)
    
    ~H"""
    <div class="flex items-center justify-between">
      <div class="flex items-center gap-2">
        <span class="text-sm">Show</span>
        <select class="select select-bordered select-sm" phx-change={@on_page_size_change}>
          <%= for size <- @page_sizes do %>
            <option value={size} selected={size == @page_size}><%= size %></option>
          <% end %>
        </select>
        <span class="text-sm">entries</span>
      </div>
      
      <.pagination 
        current_page={@current_page} 
        total_pages={@total_pages}
        on_page_change={@on_page_change}
        show_prev_next={true}
        show_first_last={true}
      />
      
      <div class="text-sm">
        Showing <%= (@current_page - 1) * @page_size + 1 %> to 
        <%= min(@current_page * @page_size, @total_items) %> of 
        <%= @total_items %> entries
      </div>
    </div>
    """
  end
end