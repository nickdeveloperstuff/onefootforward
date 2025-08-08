defmodule SuperdupernovaWeb.ChatTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets
  
  import SuperdupernovaWeb.Widgets.Display

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-8 bg-base-100 min-h-screen">
      <h1 class="text-3xl font-bold mb-8">Chat Bubble Widget Test - Phase 3</h1>
      
      <!-- Basic Chat Bubbles -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Basic Chat Bubbles</h2>
        <div class="bg-base-200 rounded-lg p-4 space-y-2">
          <.chat_bubble 
            message="Hello! How can I help you today?" 
            sender="Assistant"
            time="10:00 AM"
            align="start"
            color="secondary"
          />
          <.chat_bubble 
            message="I need help with my order #12345" 
            sender="You"
            time="10:01 AM"
            align="end"
            color="primary"
          />
          <.chat_bubble 
            message="I'll look that up for you right away!" 
            sender="Assistant"
            time="10:01 AM"
            align="start"
            color="secondary"
          />
        </div>
      </div>

      <!-- Chat with Avatars -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Chat with Avatars</h2>
        <div class="bg-base-200 rounded-lg p-4 space-y-2">
          <.chat_bubble 
            message="Welcome to our support chat!" 
            sender="Sarah"
            time="2:30 PM"
            avatar="https://via.placeholder.com/150/FF6B6B/FFFFFF?text=S"
            align="start"
            color="info"
          />
          <.chat_bubble 
            message="Thanks! I have a question about pricing." 
            sender="John"
            time="2:31 PM"
            avatar="https://via.placeholder.com/150/4ECDC4/FFFFFF?text=J"
            align="end"
            color="primary"
          />
          <.chat_bubble 
            message="I'd be happy to help with that. What specific pricing information do you need?" 
            sender="Sarah"
            time="2:31 PM"
            avatar="https://via.placeholder.com/150/FF6B6B/FFFFFF?text=S"
            align="start"
            color="info"
          />
        </div>
      </div>

      <!-- Different Message Types -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Different Message Types</h2>
        <div class="bg-base-200 rounded-lg p-4 space-y-2">
          <.chat_bubble 
            message="✅ Task completed successfully!" 
            sender="System"
            time="3:45 PM"
            align="start"
            color="success"
          />
          <.chat_bubble 
            message="⚠️ Warning: Low disk space" 
            sender="System"
            time="3:46 PM"
            align="start"
            color="warning"
          />
          <.chat_bubble 
            message="❌ Error: Unable to process request" 
            sender="System"
            time="3:47 PM"
            align="start"
            color="error"
          />
          <.chat_bubble 
            message="ℹ️ Info: New update available" 
            sender="System"
            time="3:48 PM"
            align="start"
            color="info"
          />
        </div>
      </div>

      <!-- Chat Conversation -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Full Conversation</h2>
        <div class="bg-base-200 rounded-lg max-w-2xl">
          <.chat_conversation 
            messages={@messages}
            current_user="You"
            show_typing={@show_typing}
          />
          <.chat_input 
            placeholder="Type your message..."
            on_send="send_message"
            disabled={false}
          />
        </div>
      </div>

      <!-- Group Chat -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Group Chat</h2>
        <div class="bg-base-200 rounded-lg p-4 space-y-2">
          <.chat_bubble 
            message="Hey team! Ready for the meeting?" 
            sender="Alice"
            time="4:00 PM"
            avatar="https://via.placeholder.com/150/FF6B6B/FFFFFF?text=A"
            align="start"
            color="secondary"
          />
          <.chat_bubble 
            message="Yes, I'll share my screen" 
            sender="Bob"
            time="4:01 PM"
            avatar="https://via.placeholder.com/150/4ECDC4/FFFFFF?text=B"
            align="start"
            color="accent"
          />
          <.chat_bubble 
            message="I'm ready too!" 
            sender="You"
            time="4:01 PM"
            align="end"
            color="primary"
          />
          <.chat_bubble 
            message="Great! Let's start with the Q4 review" 
            sender="Alice"
            time="4:02 PM"
            avatar="https://via.placeholder.com/150/FF6B6B/FFFFFF?text=A"
            align="start"
            color="secondary"
          />
        </div>
      </div>

      <!-- Chat with Actions -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Chat with Actions</h2>
        <div class="bg-base-200 rounded-lg p-4 space-y-2">
          <.chat_bubble 
            message="Would you like to schedule a callback?" 
            sender="Support"
            time="5:00 PM"
            align="start"
            color="info"
          >
            <:actions>
              <button class="btn btn-xs btn-primary mr-2">Yes, please</button>
              <button class="btn btn-xs btn-ghost">No, thanks</button>
            </:actions>
          </.chat_bubble>
          <.chat_bubble 
            message="Here's the document you requested" 
            sender="Assistant"
            time="5:15 PM"
            align="start"
            color="secondary"
          >
            <:actions>
              <button class="btn btn-xs btn-info">Download PDF</button>
            </:actions>
          </.chat_bubble>
        </div>
      </div>

      <!-- Typing Indicator -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Typing Indicator</h2>
        <div class="bg-base-200 rounded-lg p-4">
          <.chat_typing_indicator />
        </div>
      </div>

      <!-- Long Messages -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Long Messages</h2>
        <div class="bg-base-200 rounded-lg p-4 space-y-2">
          <.chat_bubble 
            message="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat." 
            sender="Bot"
            time="6:00 PM"
            align="start"
            color="secondary"
          />
          <.chat_bubble 
            message="Thanks for the detailed explanation!" 
            sender="You"
            time="6:01 PM"
            align="end"
            color="primary"
          />
        </div>
      </div>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    messages = [
      %{text: "Welcome to our chat!", sender: "Assistant", time: "9:00 AM"},
      %{text: "Hi there! I have a question", sender: "You", time: "9:01 AM"},
      %{text: "I'd be happy to help! What's your question?", sender: "Assistant", time: "9:01 AM"},
      %{text: "How do I reset my password?", sender: "You", time: "9:02 AM"},
      %{text: "You can reset your password by clicking on 'Forgot Password' on the login page", sender: "Assistant", time: "9:02 AM"}
    ]
    
    {:ok, assign(socket, messages: messages, show_typing: false)}
  end

  @impl true
  def handle_event("send_message", %{"value" => _value}, socket) do
    # Handle message sending
    {:noreply, socket}
  end
end