defmodule SuperdupernovaWeb.TimelineTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets
  alias SuperdupernovaWeb.Widgets.Display

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-2xl font-bold mb-unit-4">Timeline Widget Test Page</h1>
      
        <!-- Basic Timeline -->
        <h2 class="text-xl font-semibold mb-unit-2">Basic Timeline</h2>
        <.lego_grid>
          <div class="widget-12x4">
            <Display.timeline>
              <:items>
                <Display.timeline_item 
                  title="Project Started"
                  time="January 2024"
                  icon="🚀"
                  status="success"
                >
                  Initial project setup and planning phase completed.
                </Display.timeline_item>
              </:items>
              
              <:items>
                <Display.timeline_item 
                  title="Development Phase"
                  time="February 2024"
                  icon="💻"
                  status="info"
                >
                  Core features implementation and testing.
                </Display.timeline_item>
              </:items>
              
              <:items>
                <Display.timeline_item 
                  title="Beta Release"
                  time="March 2024"
                  icon="🎯"
                  status="warning"
                >
                  Beta version released to selected users for testing.
                </Display.timeline_item>
              </:items>
              
              <:items>
                <Display.timeline_item 
                  title="Production Launch"
                  time="April 2024"
                  icon="🎉"
                  status="primary"
                >
                  Full production release with all features enabled.
                </Display.timeline_item>
              </:items>
            </Display.timeline>
          </div>
        </.lego_grid>

        <!-- Alternating Timeline -->
        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">Alternating Timeline</h2>
        <.lego_grid>
          <div class="widget-12x4">
            <Display.timeline_alternating items={[
              %{title: "Morning Standup", time: "9:00 AM", content: "Daily team sync and planning session."},
              %{title: "Sprint Planning", time: "10:30 AM", content: "Review and prioritize upcoming sprint tasks."},
              %{title: "Code Review", time: "2:00 PM", content: "Team code review and feedback session."},
              %{title: "Deployment", time: "4:00 PM", content: "Deploy latest changes to production."}
            ]} />
          </div>
        </.lego_grid>

        <!-- Timeline with Different Statuses -->
        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">Timeline with Different Statuses</h2>
        <.lego_grid>
          <div class="widget-12x4">
            <Display.timeline>
              <:items>
                <Display.timeline_item 
                  title="Primary Event"
                  time="Step 1"
                  status="primary"
                >
                  This is a primary timeline item.
                </Display.timeline_item>
              </:items>
              
              <:items>
                <Display.timeline_item 
                  title="Secondary Event"
                  time="Step 2"
                  status="secondary"
                >
                  This is a secondary timeline item.
                </Display.timeline_item>
              </:items>
              
              <:items>
                <Display.timeline_item 
                  title="Success Event"
                  time="Step 3"
                  status="success"
                >
                  This is a success timeline item.
                </Display.timeline_item>
              </:items>
              
              <:items>
                <Display.timeline_item 
                  title="Warning Event"
                  time="Step 4"
                  status="warning"
                >
                  This is a warning timeline item.
                </Display.timeline_item>
              </:items>
              
              <:items>
                <Display.timeline_item 
                  title="Error Event"
                  time="Step 5"
                  status="error"
                >
                  This is an error timeline item.
                </Display.timeline_item>
              </:items>
            </Display.timeline>
          </div>
        </.lego_grid>

        <!-- Compact Timeline -->
        <h2 class="text-xl font-semibold mb-unit-2 mt-unit-4">Compact Timeline</h2>
        <.lego_grid>
          <div class="widget-12x2">
            <Display.timeline compact={true}>
              <:items>
                <Display.timeline_item 
                  title="Step 1"
                  status="primary"
                >
                  First step
                </Display.timeline_item>
              </:items>
              
              <:items>
                <Display.timeline_item 
                  title="Step 2"
                  status="primary"
                >
                  Second step
                </Display.timeline_item>
              </:items>
              
              <:items>
                <Display.timeline_item 
                  title="Step 3"
                  status="primary"
                >
                  Third step
                </Display.timeline_item>
              </:items>
            </Display.timeline>
          </div>
        </.lego_grid>
      </.lego_container>
    </div>
    """
  end
end