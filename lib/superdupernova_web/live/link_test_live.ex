defmodule SuperdupernovaWeb.LinkTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets
  alias SuperdupernovaWeb.Widgets.Layout

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-2xl font-bold mb-unit-4">Link Widget Test Page</h1>
      
        <h2 class="text-xl font-semibold mb-unit-2">Styled Links - All Variants</h2>
        <.lego_grid>
          <div class="widget-12x2">
            <div class="flex flex-wrap gap-4 p-4 bg-base-200 rounded-lg">
              <Layout.styled_link href="#" variant="primary">Primary Link</Layout.styled_link>
              <Layout.styled_link href="#" variant="secondary">Secondary Link</Layout.styled_link>
              <Layout.styled_link href="#" variant="accent">Accent Link</Layout.styled_link>
              <Layout.styled_link href="#" variant="ghost">Ghost Link</Layout.styled_link>
              <Layout.styled_link href="#" variant="link">Link Style</Layout.styled_link>
              <Layout.styled_link href="#" variant="info">Info Link</Layout.styled_link>
              <Layout.styled_link href="#" variant="success">Success Link</Layout.styled_link>
              <Layout.styled_link href="#" variant="warning">Warning Link</Layout.styled_link>
              <Layout.styled_link href="#" variant="error">Error Link</Layout.styled_link>
            </div>
          </div>
        </.lego_grid>

        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">Underline Variants</h2>
        <.lego_grid>
          <div class="widget-12x1">
            <div class="flex flex-wrap gap-6 p-4 bg-base-200 rounded-lg">
              <Layout.styled_link href="#" underline="always" variant="primary">
                Always Underlined
              </Layout.styled_link>
              <Layout.styled_link href="#" underline="hover" variant="primary">
                Underlined on Hover
              </Layout.styled_link>
              <Layout.styled_link href="#" underline="none" variant="primary">
                Never Underlined
              </Layout.styled_link>
            </div>
          </div>
        </.lego_grid>

        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">LiveView Navigation Links</h2>
        <.lego_grid>
          <div class="widget-12x1">
            <div class="flex flex-wrap gap-4 p-4 bg-base-200 rounded-lg">
              <Layout.styled_link navigate="/dashboard" variant="primary">
                Dashboard (Navigate)
              </Layout.styled_link>
              <Layout.styled_link navigate="/profile" variant="secondary">
                Profile (Navigate)
              </Layout.styled_link>
              <Layout.styled_link navigate="/settings" variant="accent">
                Settings (Navigate)
              </Layout.styled_link>
            </div>
          </div>
        </.lego_grid>

        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">Button Links - All Sizes</h2>
        <.lego_grid>
          <div class="widget-12x1">
            <div class="flex flex-wrap gap-4 items-center p-4 bg-base-200 rounded-lg">
              <Layout.button_link href="#" size="xs" variant="primary">Extra Small</Layout.button_link>
              <Layout.button_link href="#" size="sm" variant="primary">Small</Layout.button_link>
              <Layout.button_link href="#" size="md" variant="primary">Medium</Layout.button_link>
              <Layout.button_link href="#" size="lg" variant="primary">Large</Layout.button_link>
            </div>
          </div>
        </.lego_grid>

        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">Button Links - All Variants</h2>
        <.lego_grid>
          <div class="widget-12x2">
            <div class="flex flex-wrap gap-4 p-4 bg-base-200 rounded-lg">
              <Layout.button_link href="#" variant="primary">Primary</Layout.button_link>
              <Layout.button_link href="#" variant="secondary">Secondary</Layout.button_link>
              <Layout.button_link href="#" variant="accent">Accent</Layout.button_link>
              <Layout.button_link href="#" variant="info">Info</Layout.button_link>
              <Layout.button_link href="#" variant="success">Success</Layout.button_link>
              <Layout.button_link href="#" variant="warning">Warning</Layout.button_link>
              <Layout.button_link href="#" variant="error">Error</Layout.button_link>
            </div>
          </div>
        </.lego_grid>

        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">Button Links - Outline Style</h2>
        <.lego_grid>
          <div class="widget-12x2">
            <div class="flex flex-wrap gap-4 p-4 bg-base-200 rounded-lg">
              <Layout.button_link href="#" variant="primary" outline={true}>Primary Outline</Layout.button_link>
              <Layout.button_link href="#" variant="secondary" outline={true}>Secondary Outline</Layout.button_link>
              <Layout.button_link href="#" variant="accent" outline={true}>Accent Outline</Layout.button_link>
              <Layout.button_link href="#" variant="info" outline={true}>Info Outline</Layout.button_link>
              <Layout.button_link href="#" variant="success" outline={true}>Success Outline</Layout.button_link>
              <Layout.button_link href="#" variant="warning" outline={true}>Warning Outline</Layout.button_link>
              <Layout.button_link href="#" variant="error" outline={true}>Error Outline</Layout.button_link>
            </div>
          </div>
        </.lego_grid>

        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">Button Links with LiveView Navigation</h2>
        <.lego_grid>
          <div class="widget-12x1">
            <div class="flex flex-wrap gap-4 p-4 bg-base-200 rounded-lg">
              <Layout.button_link navigate="/dashboard" variant="primary">
                Go to Dashboard
              </Layout.button_link>
              <Layout.button_link navigate="/profile" variant="secondary" outline={true}>
                View Profile
              </Layout.button_link>
              <Layout.button_link navigate="/settings" variant="accent" size="lg">
                Settings
              </Layout.button_link>
            </div>
          </div>
        </.lego_grid>

        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">Links with Custom Classes</h2>
        <.lego_grid>
          <div class="widget-12x1">
            <div class="flex flex-wrap gap-4 p-4 bg-base-200 rounded-lg">
              <Layout.styled_link href="#" variant="primary" class="font-bold text-lg">
                Bold Large Link
              </Layout.styled_link>
              <Layout.button_link href="#" variant="secondary" class="rounded-full">
                Rounded Button Link
              </Layout.button_link>
              <Layout.styled_link href="#" variant="accent" class="italic">
                Italic Link
              </Layout.styled_link>
            </div>
          </div>
        </.lego_grid>
      </.lego_container>
    </div>
    """
  end
end