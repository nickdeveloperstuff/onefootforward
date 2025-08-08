defmodule SuperdupernovaWeb.Phase6TestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-3xl font-bold mb-6">Phase 6: Progress & Status Components Test</h1>
        
        <.lego_grid>
          <!-- Section 6.1.1: Radial Progress Full Implementation -->
          <div class="widget-12x4">
            <h2 class="text-2xl font-semibold mb-4">6.1.1 Radial Progress Widget</h2>
            
            <!-- Different sizes -->
            <div class="mb-6">
              <h3 class="text-lg font-medium mb-3">Different Sizes</h3>
              <div class="flex items-center gap-4">
                <.radial_progress value={25} size="xs" />
                <.radial_progress value={40} size="sm" />
                <.radial_progress value={60} size="md" />
                <.radial_progress value={75} size="lg" />
                <.radial_progress value={90} size="xl" />
              </div>
            </div>
            
            <!-- Different variants/colors -->
            <div class="mb-6">
              <h3 class="text-lg font-medium mb-3">Different Variants</h3>
              <div class="flex items-center gap-4 flex-wrap">
                <.radial_progress value={70} variant="primary" />
                <.radial_progress value={65} variant="secondary" />
                <.radial_progress value={80} variant="accent" />
                <.radial_progress value={55} variant="info" />
                <.radial_progress value={90} variant="success" />
                <.radial_progress value={40} variant="warning" />
                <.radial_progress value={25} variant="error" />
                <.radial_progress value={50} variant="neutral" />
              </div>
            </div>
            
            <!-- Different thickness values -->
            <div class="mb-6">
              <h3 class="text-lg font-medium mb-3">Different Thickness</h3>
              <div class="flex items-center gap-4">
                <.radial_progress value={60} thickness="2" />
                <.radial_progress value={60} thickness="4" />
                <.radial_progress value={60} thickness="6" />
                <.radial_progress value={60} thickness="8" />
                <.radial_progress value={60} thickness="10" />
              </div>
            </div>
            
            <!-- Without value display -->
            <div class="mb-6">
              <h3 class="text-lg font-medium mb-3">Without Value Display</h3>
              <div class="flex items-center gap-4">
                <.radial_progress value={45} show_value={false} />
                <.radial_progress value={70} show_value={false} variant="success" />
                <.radial_progress value={30} show_value={false} variant="error" size="lg" />
              </div>
            </div>
            
            <!-- Custom max values -->
            <div class="mb-6">
              <h3 class="text-lg font-medium mb-3">Custom Max Values</h3>
              <div class="flex items-center gap-4">
                <div class="text-center">
                  <.radial_progress value={150} max={200} variant="info" />
                  <p class="text-sm mt-2">150/200</p>
                </div>
                <div class="text-center">
                  <.radial_progress value={7} max={10} variant="success" />
                  <p class="text-sm mt-2">7/10</p>
                </div>
                <div class="text-center">
                  <.radial_progress value={450} max={1000} variant="warning" />
                  <p class="text-sm mt-2">450/1000</p>
                </div>
              </div>
            </div>
          </div>
          
          <!-- Section 6.1.2: List Component -->
          <div class="widget-12x4">
            <h2 class="text-2xl font-semibold mb-4">6.1.2 List Component</h2>
            
            <div class="grid grid-cols-2 gap-6">
              <!-- Unordered list -->
              <div>
                <h3 class="text-lg font-medium mb-3">Unordered List</h3>
                <SuperdupernovaWeb.Widgets.Display.list items={["First item", "Second item", "Third item", "Fourth item"]} type="unordered" />
              </div>
              
              <!-- Ordered list -->
              <div>
                <h3 class="text-lg font-medium mb-3">Ordered List</h3>
                <SuperdupernovaWeb.Widgets.Display.list items={["Step one", "Step two", "Step three", "Step four"]} type="ordered" />
              </div>
              
              <!-- Menu list -->
              <div>
                <h3 class="text-lg font-medium mb-3">Menu List</h3>
                <SuperdupernovaWeb.Widgets.Display.list 
                  items={["Dashboard", "Profile", "Settings", "Logout"]} 
                  type="menu" 
                  hover={true}
                />
              </div>
              
              <!-- Steps list -->
              <div>
                <h3 class="text-lg font-medium mb-3">Steps List</h3>
                <SuperdupernovaWeb.Widgets.Display.list 
                  items={[
                    %{label: "Register", completed: true},
                    %{label: "Choose plan", completed: true},
                    %{label: "Purchase", completed: false},
                    %{label: "Receive Product", completed: false}
                  ]} 
                  type="steps"
                />
              </div>
              
              <!-- Different sizes -->
              <div>
                <h3 class="text-lg font-medium mb-3">Different Sizes</h3>
                <div class="space-y-4">
                  <SuperdupernovaWeb.Widgets.Display.list items={["Extra small text"]} size="xs" />
                  <SuperdupernovaWeb.Widgets.Display.list items={["Small text"]} size="sm" />
                  <SuperdupernovaWeb.Widgets.Display.list items={["Medium text"]} size="md" />
                  <SuperdupernovaWeb.Widgets.Display.list items={["Large text"]} size="lg" />
                </div>
              </div>
              
              <!-- Dense list -->
              <div>
                <h3 class="text-lg font-medium mb-3">Dense List</h3>
                <SuperdupernovaWeb.Widgets.Display.list 
                  items={["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]} 
                  dense={true}
                />
              </div>
            </div>
          </div>
          
          <!-- Section 6.1.3: Status Indicator -->
          <div class="widget-12x4">
            <h2 class="text-2xl font-semibold mb-4">6.1.3 Status Indicator</h2>
            
            <!-- All status types -->
            <div class="mb-6">
              <h3 class="text-lg font-medium mb-3">All Status Types</h3>
              <div class="grid grid-cols-2 gap-4">
                <.status_indicator status="online" />
                <.status_indicator status="offline" />
                <.status_indicator status="busy" />
                <.status_indicator status="away" />
                <.status_indicator status="active" />
                <.status_indicator status="inactive" />
                <.status_indicator status="pending" />
                <.status_indicator status="error" />
                <.status_indicator status="success" />
                <.status_indicator status="warning" />
              </div>
            </div>
            
            <!-- With custom labels -->
            <div class="mb-6">
              <h3 class="text-lg font-medium mb-3">With Custom Labels</h3>
              <div class="space-y-2">
                <div><.status_indicator status="online" label="System Operational" /></div>
                <div><.status_indicator status="error" label="Critical Error" /></div>
                <div><.status_indicator status="warning" label="Maintenance Mode" /></div>
                <div><.status_indicator status="success" label="All Tests Passed" /></div>
              </div>
            </div>
            
            <!-- Different sizes -->
            <div class="mb-6">
              <h3 class="text-lg font-medium mb-3">Different Sizes</h3>
              <div class="space-y-2">
                <.status_indicator status="online" size="xs" />
                <.status_indicator status="online" size="sm" />
                <.status_indicator status="online" size="md" />
                <.status_indicator status="online" size="lg" />
              </div>
            </div>
            
            <!-- With pulse animation -->
            <div class="mb-6">
              <h3 class="text-lg font-medium mb-3">With Pulse Animation</h3>
              <div class="space-y-2">
                <.status_indicator status="online" pulse={true} label="Live" />
                <.status_indicator status="busy" pulse={true} label="Processing" />
                <.status_indicator status="warning" pulse={true} label="Alert" />
                <.status_indicator status="error" pulse={true} label="Critical" />
              </div>
            </div>
            
            <!-- Without dots -->
            <div class="mb-6">
              <h3 class="text-lg font-medium mb-3">Without Status Dots</h3>
              <div class="space-y-2">
                <.status_indicator status="online" with_dot={false} />
                <.status_indicator status="offline" with_dot={false} />
                <.status_indicator status="pending" with_dot={false} />
              </div>
            </div>
            
            <!-- Combined in a dashboard-like layout -->
            <div class="mb-6">
              <h3 class="text-lg font-medium mb-3">Dashboard Status Panel</h3>
              <div class="bg-base-200 rounded-lg p-4">
                <div class="grid grid-cols-2 gap-4">
                  <div class="bg-base-100 rounded p-3">
                    <div class="text-sm font-semibold mb-2">API Server</div>
                    <.status_indicator status="online" pulse={true} />
                  </div>
                  <div class="bg-base-100 rounded p-3">
                    <div class="text-sm font-semibold mb-2">Database</div>
                    <.status_indicator status="online" />
                  </div>
                  <div class="bg-base-100 rounded p-3">
                    <div class="text-sm font-semibold mb-2">Background Jobs</div>
                    <.status_indicator status="busy" pulse={true} />
                  </div>
                  <div class="bg-base-100 rounded p-3">
                    <div class="text-sm font-semibold mb-2">Backup Service</div>
                    <.status_indicator status="offline" />
                  </div>
                </div>
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