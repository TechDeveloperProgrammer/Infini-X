package logger

import (
	"log"
	os "os"
)

// SetupLogger initializes a basic logger.
func SetupLogger() {
	log.SetOutput(os.Stdout)
	log.SetFlags(log.Ldate | log.Ltime | log.Lshortfile)
}

// Info logs an informational message.
func Info(msg string, args ...interface{}) {
	log.Printf("INFO: "+msg+"\n", args...)
}

// Error logs an error message.
func Error(msg string, args ...interface{}) {
	log.Printf("ERROR: "+msg+"\n", args...)
}
