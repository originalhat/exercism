package bob

import (
	"strings"
)

func Hey(remark string) string {
	if silence(remark) {
		return "Fine. Be that way!"
	} else if numeric(remark) && question(remark) {
		return "Sure."
	} else if numeric(remark) {
		return "Whatever."
	} else if shouting(remark) && question(remark) {
		return "Calm down, I know what I'm doing!"
	} else if shouting(remark) {
		return "Whoa, chill out!"
	} else if question(remark) {
		return "Sure."
	} else {
		return "Whatever."
	}

}
func silence(remark string) bool {
	return len(strings.TrimSpace(remark)) == 0
}

func numeric(remark string) bool {
	return strings.ToUpper(remark) == strings.ToLower(remark)
}

func question(remark string) bool {
	return string(strings.TrimSpace(remark)[len(strings.TrimSpace(remark))-1]) == "?"
}

func shouting(remark string) bool {
	return strings.ToUpper(remark) == remark
}

