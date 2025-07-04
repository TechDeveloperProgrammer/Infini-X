
package users

import "fmt"

// User represents a user in the system.
type User struct {
	ID       string
	Username string
	Email    string
}

// GetUserByID retrieves a user by their ID.
func GetUserByID(id string) (*User, error) {
	// Simulate database lookup
	if id == "123" {
		return &User{ID: "123", Username: "testuser", Email: "test@example.com"}, nil
	}
	return nil, fmt.Errorf("user not found")
}

// CreateUser creates a new user.
func CreateUser(username, email string) (*User, error) {
	// Simulate database insertion
	newUser := &User{ID: "new_id", Username: username, Email: email}
	return newUser, nil
}
