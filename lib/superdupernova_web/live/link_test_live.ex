defmodule SuperdupernovaWeb.LinkTestLive do
  use SuperdupernovaWeb, :live_view
  alias SuperdupernovaWeb.Widgets.Layout

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="p-8 space-y-8">
      <h1 class="text-3xl font-bold mb-8">Link Widget Test Page</h1>
      
      <!-- Styled Links - All Variants -->
      <section>
        <h2 class="text-2xl font-semibold mb-4">Styled Links - All Variants</h2>
        <div class="flex flex-wrap gap-4">
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
      </section>

      <!-- Underline Variants -->
      <section>
        <h2 class="text-2xl font-semibold mb-4">Underline Variants</h2>
        <div class="flex flex-wrap gap-6">
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
      </section>

      <!-- LiveView Navigation Links -->
      <section>
        <h2 class="text-2xl font-semibold mb-4">LiveView Navigation Links</h2>
        <div class="flex flex-wrap gap-4">
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
      </section>

      <!-- Button Links - All Sizes -->
      <section>
        <h2 class="text-2xl font-semibold mb-4">Button Links - All Sizes</h2>
        <div class="flex flex-wrap gap-4 items-center">
          <Layout.button_link href="#" size="xs" variant="primary">Extra Small</Layout.button_link>
          <Layout.button_link href="#" size="sm" variant="primary">Small</Layout.button_link>
          <Layout.button_link href="#" size="md" variant="primary">Medium</Layout.button_link>
          <Layout.button_link href="#" size="lg" variant="primary">Large</Layout.button_link>
        </div>
      </section>

      <!-- Button Links - All Variants -->
      <section>
        <h2 class="text-2xl font-semibold mb-4">Button Links - All Variants</h2>
        <div class="flex flex-wrap gap-4">
          <Layout.button_link href="#" variant="primary">Primary</Layout.button_link>
          <Layout.button_link href="#" variant="secondary">Secondary</Layout.button_link>
          <Layout.button_link href="#" variant="accent">Accent</Layout.button_link>
          <Layout.button_link href="#" variant="info">Info</Layout.button_link>
          <Layout.button_link href="#" variant="success">Success</Layout.button_link>
          <Layout.button_link href="#" variant="warning">Warning</Layout.button_link>
          <Layout.button_link href="#" variant="error">Error</Layout.button_link>
        </div>
      </section>

      <!-- Button Links - Outline Style -->
      <section>
        <h2 class="text-2xl font-semibold mb-4">Button Links - Outline Style</h2>
        <div class="flex flex-wrap gap-4">
          <Layout.button_link href="#" variant="primary" outline={true}>Primary Outline</Layout.button_link>
          <Layout.button_link href="#" variant="secondary" outline={true}>Secondary Outline</Layout.button_link>
          <Layout.button_link href="#" variant="accent" outline={true}>Accent Outline</Layout.button_link>
          <Layout.button_link href="#" variant="info" outline={true}>Info Outline</Layout.button_link>
          <Layout.button_link href="#" variant="success" outline={true}>Success Outline</Layout.button_link>
          <Layout.button_link href="#" variant="warning" outline={true}>Warning Outline</Layout.button_link>
          <Layout.button_link href="#" variant="error" outline={true}>Error Outline</Layout.button_link>
        </div>
      </section>

      <!-- Button Links with LiveView Navigation -->
      <section>
        <h2 class="text-2xl font-semibold mb-4">Button Links with LiveView Navigation</h2>
        <div class="flex flex-wrap gap-4">
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
      </section>

      <!-- Links with Custom Classes -->
      <section>
        <h2 class="text-2xl font-semibold mb-4">Links with Custom Classes</h2>
        <div class="flex flex-wrap gap-4">
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
      </section>
    </div>
    """
  end
end