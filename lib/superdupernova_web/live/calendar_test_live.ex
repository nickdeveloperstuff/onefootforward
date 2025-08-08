defmodule SuperdupernovaWeb.CalendarTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-2xl font-bold mb-4">Calendar Widget Test - Phase 4</h1>
        
        <.lego_grid>
          <!-- Basic Calendar -->
          <div class="widget-6x4">
            <h2 class="text-lg font-semibold mb-4">Basic Calendar</h2>
            <.calendar 
              selected_date={@selected_date}
              month={@current_month}
              year={@current_year}
              on_select="select_date"
            />
          </div>

          <!-- Calendar with Highlighted Dates -->
          <div class="widget-6x4">
            <h2 class="text-lg font-semibold mb-4">Calendar with Highlights</h2>
            <.calendar 
              selected_date={@selected_date}
              highlighted_dates={@highlighted_dates}
              disabled_dates={@disabled_dates}
              on_select="select_date"
            />
          </div>

          <!-- Small Calendar -->
          <div class="widget-4x4">
            <h2 class="text-lg font-semibold mb-4">Small Calendar</h2>
            <.calendar 
              size="sm"
              selected_date={@selected_date}
              on_select="select_date"
            />
          </div>

          <!-- Large Calendar -->
          <div class="widget-8x4">
            <h2 class="text-lg font-semibold mb-4">Large Calendar</h2>
            <.calendar 
              size="lg"
              selected_date={@selected_date}
              highlighted_dates={@highlighted_dates}
              on_select="select_date"
            />
          </div>

          <!-- Calendar without Navigation -->
          <div class="widget-6x4">
            <h2 class="text-lg font-semibold mb-4">Static Calendar (No Nav)</h2>
            <.calendar 
              show_nav={false}
              selected_date={@selected_date}
              month={3}
              year={2025}
              on_select="select_date"
            />
          </div>

          <!-- Date Picker -->
          <div class="widget-6x2">
            <h2 class="text-lg font-semibold mb-4">Date Picker Widget</h2>
            <div class="space-y-2">
              <.date_picker 
                value={@picker_date}
                size="sm"
                placeholder="Select small date"
                on_change="update_picker_date"
              />
              <.date_picker 
                value={@picker_date}
                size="md"
                placeholder="Select medium date"
                on_change="update_picker_date"
              />
              <.date_picker 
                value={@picker_date}
                size="lg"
                placeholder="Select large date"
                on_change="update_picker_date"
              />
              <.date_picker 
                value={@picker_date}
                disabled={true}
                placeholder="Disabled picker"
              />
            </div>
          </div>

          <!-- Selected Date Display -->
          <div class="widget-12x1">
            <div class="alert alert-info">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="stroke-current shrink-0 w-6 h-6">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
              </svg>
              <span>
                Selected Date: <%= if @selected_date, do: Date.to_iso8601(@selected_date), else: "None" %> | 
                Picker Date: <%= if @picker_date, do: Date.to_iso8601(@picker_date), else: "None" %>
              </span>
            </div>
          </div>
        </.lego_grid>
      </.lego_container>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    today = Date.utc_today()
    
    # Create some sample dates for highlighting and disabling
    highlighted_dates = [
      Date.add(today, 3),
      Date.add(today, 7),
      Date.add(today, 14),
      Date.add(today, 21)
    ]
    
    disabled_dates = [
      Date.add(today, -2),
      Date.add(today, 5),
      Date.add(today, 10)
    ]
    
    {:ok, 
     assign(socket,
       selected_date: today,
       picker_date: today,
       current_month: today.month,
       current_year: today.year,
       highlighted_dates: highlighted_dates,
       disabled_dates: disabled_dates
     )}
  end

  @impl true
  def handle_event("select_date", %{"date" => date_string}, socket) do
    case Date.from_iso8601(date_string) do
      {:ok, date} ->
        {:noreply, assign(socket, selected_date: date)}
      _ ->
        {:noreply, socket}
    end
  end

  def handle_event("select_date", _params, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("prev_month", _params, socket) do
    {month, year} = 
      case socket.assigns.current_month do
        1 -> {12, socket.assigns.current_year - 1}
        m -> {m - 1, socket.assigns.current_year}
      end
    
    {:noreply, assign(socket, current_month: month, current_year: year)}
  end

  @impl true
  def handle_event("next_month", _params, socket) do
    {month, year} = 
      case socket.assigns.current_month do
        12 -> {1, socket.assigns.current_year + 1}
        m -> {m + 1, socket.assigns.current_year}
      end
    
    {:noreply, assign(socket, current_month: month, current_year: year)}
  end

  @impl true
  def handle_event("update_picker_date", %{"date" => date_string}, socket) do
    case Date.from_iso8601(date_string) do
      {:ok, date} ->
        {:noreply, assign(socket, picker_date: date)}
      _ ->
        {:noreply, socket}
    end
  end

  def handle_event("toggle_date_picker", _params, socket) do
    # This would typically toggle a dropdown with the calendar
    # For this demo, we'll just log it
    {:noreply, socket}
  end
end