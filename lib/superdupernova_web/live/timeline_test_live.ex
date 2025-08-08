defmodule SuperdupernovaWeb.TimelineTestLive do
  use SuperdupernovaWeb, :live_view
  alias SuperdupernovaWeb.Widgets.Display

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="p-8 space-y-8">
      <h1 class="text-3xl font-bold mb-8">Timeline Widget Test Page</h1>
      
      <!-- Basic Timeline -->
      <section>
        <h2 class="text-2xl font-semibold mb-4">Basic Timeline</h2>
        <Display.timeline>
          <Display.timeline_item 
            title="Project Started"
            date="January 2024"
            icon="🚀"
            variant="success"
          >
            Initial project setup and planning phase completed.
          </Display.timeline_item>
          
          <Display.timeline_item 
            title="Development Phase"
            date="February 2024"
            icon="💻"
            variant="info"
          >
            Core features implementation and testing.
          </Display.timeline_item>
          
          <Display.timeline_item 
            title="Beta Release"
            date="March 2024"
            icon="🎯"
            variant="warning"
          >
            Beta version released to selected users for testing.
          </Display.timeline_item>
          
          <Display.timeline_item 
            title="Production Launch"
            date="April 2024"
            icon="🎉"
            variant="primary"
          >
            Full production release with all features enabled.
          </Display.timeline_item>
        </Display.timeline>
      </section>

      <!-- Alternating Timeline -->
      <section>
        <h2 class="text-2xl font-semibold mb-4">Alternating Timeline</h2>
        <Display.timeline_alternating>
          <Display.timeline_item 
            title="Morning Standup"
            date="9:00 AM"
            icon="☀️"
            variant="primary"
          >
            Daily team sync and planning session.
          </Display.timeline_item>
          
          <Display.timeline_item 
            title="Sprint Planning"
            date="10:30 AM"
            icon="📋"
            variant="info"
          >
            Review and prioritize upcoming sprint tasks.
          </Display.timeline_item>
          
          <Display.timeline_item 
            title="Code Review"
            date="2:00 PM"
            icon="👀"
            variant="warning"
          >
            Team code review and feedback session.
          </Display.timeline_item>
          
          <Display.timeline_item 
            title="Deployment"
            date="4:00 PM"
            icon="🚀"
            variant="success"
          >
            Deploy latest changes to production.
          </Display.timeline_item>
        </Display.timeline_alternating>
      </section>

      <!-- Timeline with Different Variants -->
      <section>
        <h2 class="text-2xl font-semibold mb-4">Timeline with Different Variants</h2>
        <Display.timeline>
          <Display.timeline_item 
            title="Primary Event"
            date="Step 1"
            variant="primary"
          >
            This is a primary timeline item.
          </Display.timeline_item>
          
          <Display.timeline_item 
            title="Secondary Event"
            date="Step 2"
            variant="secondary"
          >
            This is a secondary timeline item.
          </Display.timeline_item>
          
          <Display.timeline_item 
            title="Success Event"
            date="Step 3"
            variant="success"
          >
            This is a success timeline item.
          </Display.timeline_item>
          
          <Display.timeline_item 
            title="Warning Event"
            date="Step 4"
            variant="warning"
          >
            This is a warning timeline item.
          </Display.timeline_item>
          
          <Display.timeline_item 
            title="Error Event"
            date="Step 5"
            variant="error"
          >
            This is an error timeline item.
          </Display.timeline_item>
        </Display.timeline>
      </section>

      <!-- Compact Timeline -->
      <section>
        <h2 class="text-2xl font-semibold mb-4">Compact Timeline</h2>
        <Display.timeline>
          <Display.timeline_item 
            title="Step 1"
            variant="primary"
          >
            First step
          </Display.timeline_item>
          
          <Display.timeline_item 
            title="Step 2"
            variant="primary"
          >
            Second step
          </Display.timeline_item>
          
          <Display.timeline_item 
            title="Step 3"
            variant="primary"
          >
            Third step
          </Display.timeline_item>
        </Display.timeline>
      </section>
    </div>
    """
  end
end