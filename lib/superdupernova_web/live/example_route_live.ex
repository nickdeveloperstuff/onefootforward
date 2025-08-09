defmodule SuperdupernovaWeb.ExampleRouteLive do
  use SuperdupernovaWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <h1>Test Example Route</h1>
      <p>This is a blank placeholder page at /test/example-route</p>
      <p>This is now a LiveView!</p>
    </div>
    """
  end
end