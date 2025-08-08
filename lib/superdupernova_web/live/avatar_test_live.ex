defmodule SuperdupernovaWeb.AvatarTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-2xl font-bold mb-unit-4">Avatar Widget Test</h1>
        
        <h2 class="text-xl font-semibold mb-unit-2">Avatar Sizes</h2>
        <.lego_grid>
          <div class="widget-12x2">
            <div class="flex gap-4 items-center justify-center p-4 bg-base-200 rounded-lg">
              <.avatar size="xs" src="https://via.placeholder.com/150" />
              <.avatar size="sm" src="https://via.placeholder.com/150" />
              <.avatar size="md" src="https://via.placeholder.com/150" />
              <.avatar size="lg" src="https://via.placeholder.com/150" />
              <.avatar size="xl" src="https://via.placeholder.com/150" />
            </div>
          </div>
        </.lego_grid>

        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">Avatar Status Indicators</h2>
        <.lego_grid>
          <div class="widget-12x2">
            <div class="flex gap-8 items-center justify-center p-4 bg-base-200 rounded-lg">
              <.avatar_with_status status="online" placeholder="ON" show_status={true} size="lg" />
              <.avatar_with_status status="offline" placeholder="OFF" show_status={true} size="lg" />
              <.avatar_with_status status="away" placeholder="AW" show_status={true} size="lg" />
              <.avatar_with_status status="busy" placeholder="BS" show_status={true} size="lg" />
            </div>
          </div>
        </.lego_grid>

        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">Avatar Groups</h2>
        <.lego_grid>
          <div class="widget-6x2">
            <div class="p-4 bg-base-200 rounded-lg">
              <h3 class="text-sm font-medium mb-3">Group with 3 max display</h3>
              <.avatar_group max_display={3}>
                <:avatars><.avatar size="md" placeholder="A" /></:avatars>
                <:avatars><.avatar size="md" placeholder="B" /></:avatars>
                <:avatars><.avatar size="md" placeholder="C" /></:avatars>
                <:avatars><.avatar size="md" placeholder="D" /></:avatars>
                <:avatars><.avatar size="md" placeholder="E" /></:avatars>
              </.avatar_group>
            </div>
          </div>
          
          <div class="widget-6x2">
            <div class="p-4 bg-base-200 rounded-lg">
              <h3 class="text-sm font-medium mb-3">Group with 5 max display</h3>
              <.avatar_group max_display={5}>
                <:avatars><.avatar size="md" src="https://via.placeholder.com/150/0000FF/808080" /></:avatars>
                <:avatars><.avatar size="md" src="https://via.placeholder.com/150/FF0000/FFFFFF" /></:avatars>
                <:avatars><.avatar size="md" src="https://via.placeholder.com/150/00FF00/000000" /></:avatars>
                <:avatars><.avatar size="md" src="https://via.placeholder.com/150/FFFF00/000000" /></:avatars>
                <:avatars><.avatar size="md" src="https://via.placeholder.com/150/FF00FF/FFFFFF" /></:avatars>
                <:avatars><.avatar size="md" src="https://via.placeholder.com/150/00FFFF/000000" /></:avatars>
              </.avatar_group>
            </div>
          </div>
        </.lego_grid>

        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">Avatar Shapes & Placeholder Text</h2>
        <.lego_grid>
          <div class="widget-4x2">
            <div class="p-4 bg-base-200 rounded-lg text-center">
              <h3 class="text-sm font-medium mb-3">Circle (Default)</h3>
              <div class="flex justify-center gap-2">
                <.avatar shape="circle" placeholder="JD" size="lg" />
                <.avatar shape="circle" placeholder="AB" size="lg" />
              </div>
            </div>
          </div>
          
          <div class="widget-4x2">
            <div class="p-4 bg-base-200 rounded-lg text-center">
              <h3 class="text-sm font-medium mb-3">Square</h3>
              <div class="flex justify-center gap-2">
                <.avatar shape="square" placeholder="SQ" size="lg" />
                <.avatar shape="square" placeholder="XY" size="lg" />
              </div>
            </div>
          </div>
          
          <div class="widget-4x2">
            <div class="p-4 bg-base-200 rounded-lg text-center">
              <h3 class="text-sm font-medium mb-3">With Images</h3>
              <div class="flex justify-center gap-2">
                <.avatar shape="circle" src="https://via.placeholder.com/150/FF6B6B/FFFFFF" size="lg" />
                <.avatar shape="square" src="https://via.placeholder.com/150/4ECDC4/FFFFFF" size="lg" />
              </div>
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