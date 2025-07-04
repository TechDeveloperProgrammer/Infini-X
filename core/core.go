
package core

import "fmt"

// Version of the Infini-X core library
const Version = "0.1.0"

// Greet returns a greeting message.
func Greet(name string) string {
	return fmt.Sprintf("Hello, %s! Welcome to Infini-X Core.", name)
}
