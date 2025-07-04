
package auth

import "fmt"

// AuthenticateUser simulates user authentication.
func AuthenticateUser(username, password string) (bool, error) {
	if username == "testuser" && password == "testpass" {
		return true, nil
	}
	return false, fmt.Errorf("invalid credentials")
}
