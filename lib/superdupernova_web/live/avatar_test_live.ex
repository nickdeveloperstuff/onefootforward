defmodule SuperdupernovaWeb.AvatarTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-2xl font-bold mb-4">Avatar Widget Test</h1>
        
        <.lego_grid>
          <!-- Basic avatars with different sizes -->
          <div class="widget-12x1">
            <h2 class="text-lg font-semibold mb-2">Avatar Sizes</h2>
            <div class="flex gap-4 items-center">
              <.avatar size="xs" src="https://via.placeholder.com/150" />
              <.avatar size="sm" src="https://via.placeholder.com/150" />
              <.avatar size="md" src="https://via.placeholder.com/150" />
              <.avatar size="lg" src="https://via.placeholder.com/150" />
              <.avatar size="xl" src="https://via.placeholder.com/150" />
            </div>
          </div>

          <!-- Avatars with status -->
          <div class="widget-12x1">
            <h2 class="text-lg font-semibold mb-2">Avatar Status Indicators</h2>
            <div class="flex gap-4">
              <.avatar_with_status status="online" placeholder="ON" show_status={true} />
              <.avatar_with_status status="offline" placeholder="OFF" show_status={true} />
              <.avatar_with_status status="away" placeholder="AW" show_status={true} />
              <.avatar_with_status status="busy" placeholder="BS" show_status={true} />
            </div>
          </div>

          <!-- Avatar group -->
          <div class="widget-12x1">
            <h2 class="text-lg font-semibold mb-2">Avatar Group</h2>
            <.avatar_group max_display={3}>
              <:avatars><.avatar size="sm" placeholder="A" /></:avatars>
              <:avatars><.avatar size="sm" placeholder="B" /></:avatars>
              <:avatars><.avatar size="sm" placeholder="C" /></:avatars>
              <:avatars><.avatar size="sm" placeholder="D" /></:avatars>
              <:avatars><.avatar size="sm" placeholder="E" /></:avatars>
            </.avatar_group>
          </div>

          <!-- Shape variants -->
          <div class="widget-12x1">
            <h2 class="text-lg font-semibold mb-2">Avatar Shapes</h2>
            <div class="flex gap-4">
              <.avatar shape="circle" placeholder="CI" />
              <.avatar shape="square" placeholder="SQ" />
            </div>
          </div>
        </.lego_grid>
      </.lego_container>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end