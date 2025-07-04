
package model

// User represents a user in the system.
type User struct {
	ID       string `json:"id"`
	Username string `json:"username"`
	Email    string `json:"email"`
}

// Device represents a connected device.
type Device struct {
	ID   string `json:"id"`
	Name string `json:"name"`
	Type string `json:"type"`
}

// AIRequest represents a request to the AI service.
type AIRequest struct {
	AudioPath string `json:"audio_path,omitempty"`
	Text      string `json:"text,omitempty"`
	Model     string `json:"model,omitempty"`
}

// AIResponse represents a response from the AI service.
type AIResponse struct {
	Text      string `json:"text,omitempty"`
	AudioData []byte `json:"audio_data,omitempty"`
	Error     string `json:"error,omitempty"`
}
