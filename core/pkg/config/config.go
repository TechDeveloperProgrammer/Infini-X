
package config

import (
	"fmt"
	"io/ioutil"
	"gopkg.in/yaml.v2"
)

// AppConfig represents the application configuration.
type AppConfig struct {
	API struct {
		BaseURL string `yaml:"base_url"`
		TimeoutSeconds int `yaml:"timeout_seconds"`
	} `yaml:"api"`
	Features struct {
		DarkMode bool `yaml:"dark_mode"`
		ExperimentalAI bool `yaml:"experimental_ai"`
	} `yaml:"features"`
}

// LoadConfig loads configuration from a YAML file.
func LoadConfig(path string) (*AppConfig, error) {
	data, err := ioutil.ReadFile(path)
	if err != nil {
		return nil, fmt.Errorf("failed to read config file: %w", err)
	}

	var config AppConfig
	err = yaml.Unmarshal(data, &config)
	if err != nil {
		return nil, fmt.Errorf("failed to unmarshal config: %w", err)
	}

	return &config, nil
}
