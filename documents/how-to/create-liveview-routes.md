# How to Create LiveView Routes in Superdupernova

**IMPORTANT**: This project uses Phoenix LiveView for ALL routes and pages. Do NOT use regular controllers.

## Table of Contents
1. [Creating a PUBLIC LiveView Route](#creating-a-public-liveview-route)
2. [Creating a PRIVATE (Authenticated) LiveView Route](#creating-a-private-authenticated-liveview-route)
3. [Authentication Options Explained](#authentication-options-explained)
4. [Testing Your Routes](#testing-your-routes)
5. [Troubleshooting](#troubleshooting)

---

## Creating a PUBLIC LiveView Route

A public route is accessible to anyone without authentication.

### Step 1: Create the LiveView Module

**File location**: `/lib/superdupernova_web/live/your_page_name_live.ex`

**Exact steps**:
1. Navigate to the folder: `/lib/superdupernova_web/live/`
2. Create a new file named with the pattern: `your_page_name_live.ex` (always end with `_live.ex`)
3. Copy and paste this exact template:

```elixir
defmodule SuperdupernovaWeb.YourPageNameLive do
  use SuperdupernovaWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <h1>Your Page Title</h1>
      <p>Your page content goes here</p>
    </div>
    """
  end
end
```

4. Replace `YourPageNameLive` with your actual module name (must match the filename)
5. Replace the HTML content with your actual page content

### Step 2: Add the Route to the Router

**File to edit**: `/lib/superdupernova_web/router.ex`

**Exact location in file**: Look for the section that starts with:
```elixir
scope "/", SuperdupernovaWeb do
  pipe_through :browser
```

**What to add**: Add your route AFTER line 65 (after `get "/", PageController, :home`) and BEFORE line 67 (before `auth_routes AuthController...`):

```elixir
live "/your-route-path", YourPageNameLive
```

**Complete example**:
```elixir
scope "/", SuperdupernovaWeb do
  pipe_through :browser

  get "/", PageController, :home
  live "/test/example-route", ExampleRouteLive  # <-- YOUR NEW ROUTE HERE
  auth_routes AuthController, Superdupernova.Accounts.User, path: "/auth"
  # ... rest of the routes
end
```

### Step 3: Compile and Test

Run these commands in your terminal:
```bash
mix compile
```

If compilation succeeds, your route is now available at: `http://localhost:4000/your-route-path`

---

## Creating a PRIVATE (Authenticated) LiveView Route

A private route requires user authentication.

### Step 1: Create the LiveView Module

**File location**: `/lib/superdupernova_web/live/your_page_name_live.ex`

**Exact steps**:
1. Navigate to the folder: `/lib/superdupernova_web/live/`
2. Create a new file named with the pattern: `your_page_name_live.ex`
3. Copy and paste this exact template:

```elixir
defmodule SuperdupernovaWeb.YourPageNameLive do
  use SuperdupernovaWeb, :live_view
  
  # THIS LINE IS CRITICAL FOR AUTHENTICATION
  on_mount {SuperdupernovaWeb.LiveUserAuth, :live_user_required}

  @impl true
  def mount(_params, _session, socket) do
    # socket.assigns.current_user is available here
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <h1>Private Page</h1>
      <p>Welcome, <%= @current_user.email %>!</p>
      <p>Your page content goes here</p>
    </div>
    """
  end
end
```

4. Replace `YourPageNameLive` with your actual module name
5. The `on_mount` line at the top is REQUIRED for authentication

### Step 2: Add the Route to the Router

**File to edit**: `/lib/superdupernova_web/router.ex`

**Exact location in file**: Look for the `ash_authentication_live_session :authenticated_routes do` block (starts around line 28)

**What to add**: Add your route inside this block, alongside the other `live` routes:

```elixir
ash_authentication_live_session :authenticated_routes do
  # ... existing routes ...
  live "/your-private-route", YourPageNameLive
  # ... more routes ...
end
```

**Complete example** (showing where to add):
```elixir
ash_authentication_live_session :authenticated_routes do
  live "/widgets", WidgetsIndexLive
  live "/test-layout", TestLayoutLive
  live "/your-private-route", YourPageNameLive  # <-- ADD YOUR ROUTE HERE
  live "/layout-test", LayoutTestLive
  # ... rest of the routes
end
```

### Step 3: Compile and Test

Run these commands:
```bash
mix compile
```

Test by:
1. Going to `http://localhost:4000/your-private-route`
2. You should be redirected to login if not authenticated
3. After login, you can access the page

---

## Authentication Options Explained

When creating a private route, you MUST add one of these lines at the top of your LiveView module:

### Option 1: User REQUIRED (Most Common)
```elixir
on_mount {SuperdupernovaWeb.LiveUserAuth, :live_user_required}
```
- User MUST be logged in
- Redirects to login page if not authenticated
- `@current_user` is guaranteed to be available in socket.assigns

### Option 2: User OPTIONAL
```elixir
on_mount {SuperdupernovaWeb.LiveUserAuth, :live_user_optional}
```
- User MAY be logged in
- Page loads either way
- Check if `@current_user` exists before using it

### Option 3: User MUST NOT be logged in
```elixir
on_mount {SuperdupernovaWeb.LiveUserAuth, :live_no_user}
```
- User must NOT be logged in
- Used for login/registration pages
- Redirects logged-in users away

---

## Testing Your Routes

### For PUBLIC routes:
1. Open browser to `http://localhost:4000/your-route-path`
2. Page should load immediately without login

### For PRIVATE routes:
1. Open browser to `http://localhost:4000/your-private-route`
2. If not logged in → redirected to login page
3. After login → redirected back to your page
4. Check that `@current_user` data displays correctly

### Using curl for quick tests:
```bash
# Test if route exists
curl -I http://localhost:4000/your-route-path

# Check page content
curl http://localhost:4000/your-route-path
```

---

## Troubleshooting

### Error: "undefined function YourPageNameLive"
**Solution**: 
- Check that your module name in the `.ex` file matches exactly what you put in the router
- Module name must start with `SuperdupernovaWeb.`
- Example: `SuperdupernovaWeb.YourPageNameLive`

### Error: "no route found for GET /your-route"
**Solution**:
- Make sure you used `live` not `get` in the router
- Correct: `live "/path", ModuleName`
- Wrong: `get "/path", ModuleName`

### Error: "assign @current_user not available"
**Solution**:
- You're trying to use `@current_user` in a public route
- Either make it a private route (add `on_mount` line)
- Or check if it exists first: `<%= if assigns[:current_user] do %>`

### Compilation errors after adding route
**Solution**:
1. Check for missing commas in the router
2. Check for typos in module names
3. Make sure file is saved
4. Run `mix compile` to see specific error

### Page loads but looks broken
**Solution**:
- Make sure you're using the `~H"""` sigil for your template
- HTML must be valid (close all tags)
- Check browser console for JavaScript errors

---

## Complete Working Examples

### Example 1: Public About Page

**File**: `/lib/superdupernova_web/live/about_live.ex`
```elixir
defmodule SuperdupernovaWeb.AboutLive do
  use SuperdupernovaWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "About Us")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="max-w-4xl mx-auto p-6">
      <h1 class="text-4xl font-bold mb-4"><%= @page_title %></h1>
      <p class="text-lg">This is the about page.</p>
    </div>
    """
  end
end
```

**Router addition** (in the public scope):
```elixir
live "/about", AboutLive
```

### Example 2: Private Dashboard

**File**: `/lib/superdupernova_web/live/dashboard_live.ex`
```elixir
defmodule SuperdupernovaWeb.DashboardLive do
  use SuperdupernovaWeb, :live_view
  
  on_mount {SuperdupernovaWeb.LiveUserAuth, :live_user_required}

  @impl true
  def mount(_params, _session, socket) do
    user = socket.assigns.current_user
    {:ok, assign(socket, user: user, page_title: "Dashboard")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="max-w-6xl mx-auto p-6">
      <h1 class="text-4xl font-bold mb-4">Welcome to your Dashboard</h1>
      <p class="text-lg">Hello, <%= @user.email %>!</p>
      <div class="mt-8">
        <h2 class="text-2xl font-semibold">Your Stats</h2>
        <!-- Add dashboard content here -->
      </div>
    </div>
    """
  end
end
```

**Router addition** (inside `ash_authentication_live_session` block):
```elixir
live "/dashboard", DashboardLive
```

---

## Quick Reference Checklist

### For PUBLIC LiveView Route:
- [ ] Create file in `/lib/superdupernova_web/live/` ending with `_live.ex`
- [ ] Module name starts with `SuperdupernovaWeb.` and ends with `Live`
- [ ] Add `use SuperdupernovaWeb, :live_view`
- [ ] Implement `mount/3` function
- [ ] Implement `render/1` function with `~H"""` template
- [ ] Add route to router.ex in the public `scope "/", SuperdupernovaWeb` block
- [ ] Use `live` not `get` for the route
- [ ] Run `mix compile`

### For PRIVATE LiveView Route:
- [ ] All steps from PUBLIC route PLUS:
- [ ] Add `on_mount {SuperdupernovaWeb.LiveUserAuth, :live_user_required}`
- [ ] Add route inside `ash_authentication_live_session :authenticated_routes do` block
- [ ] Can use `@current_user` in the template
- [ ] Test authentication redirect works

---

## DO NOT DO THESE THINGS

1. **DO NOT** create regular controllers - only LiveView
2. **DO NOT** use `get`, `post`, `put`, `delete` for LiveView routes - use `live`
3. **DO NOT** forget the `on_mount` line for private routes
4. **DO NOT** put private routes outside the `ash_authentication_live_session` block
5. **DO NOT** forget to add `use SuperdupernovaWeb, :live_view` at the top of your module
6. **DO NOT** use regular quotes for templates - use the `~H"""` sigil
7. **DO NOT** name your files without the `_live.ex` suffix