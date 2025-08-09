defmodule SuperdupernovaWeb.FirstTimerLive do
  use SuperdupernovaWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <h1>First Timer Test Page</h1>
      <p>Welcome to the first timer test page! This is a public route at /test/first-timer</p>
    </div>
    """
  end
end