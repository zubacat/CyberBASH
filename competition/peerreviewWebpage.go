package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"os/exec"
	"strconv"
	"strings"
)

func main() {
	//  var (cmdOut []byte err error) //See line 25's cast ':='
	//var CommandAsString string //See line 27's cast ':='
	//var startip string //See line 17's cast ':='
	//var stopip string //See line 19's cast ':='

	if len(os.Args) < 4 {
		fmt.Fprintf(os.Stderr, "Usage: %s teamname starting ip, stopping ip\n", os.Args[0])
		os.Exit(1)
	}

	startip := os.Args[len(os.Args)-2] //Logic error -- you create a variable based on assumed sizes; anything for os.Args <2 creates a array of length -2 ;)
	stopip := os.Args[len(os.Args)-1]
	score := make([]int, len(os.Args))

	//Note: '_' can be thought of as "accept the return, but ignore this"
	cmdOut, _ := exec.Command("sshpass", "-pbgt56yhnNHY^%TGB", "ssh", "scoreserver@127.0.0.1", "less", "/var/www/html/index.html").Output()
	//if err != nil {}
	CommandAsString := string(cmdOut)
	//for i=1; i<100; i++{}
	fmt.Printf("Checking scores in IP range from %s to %s\n", startip, stopip)
	if strings.Contains(CommandAsString, os.Args[1]) {
		score[1]++
	}
	cmdOut, _ = exec.Command("sshpass", "-pbgt56yhnNHY^%TGB", "ssh", "scoreserver@127.0.0.1", "less", "/etc/issue.net").Output()
	//if err != nil {}
	CommandAsString = string(cmdOut)
	//fmt.Printf(CommandAsString)
	if strings.Contains(CommandAsString, os.Args[1]) {
		score[1]++
	}
	for i := 1; i < len(os.Args)-2; i++ {
		fmt.Printf("Current score for %s is %d\n", os.Args[i], score[i])
	}
	FullWebpage := []byte("<html>\n<style>table, th, td {\n\t\tborder: 1px solid black;\n}\nbody {\n\tbackground-color: white;/n}\n\nh1 {\n\tcolor: black;\n\ttext-allign: center;\n}\nh2 {\ncolor: green;\n\n}\np {\n\tfont-family: verdana;\n\tfont-size: 20px;\n}\n</style>\n<body><img src=\"airforcewings.jpeg\" alt=\"Air Force Wings\" align=\"middle\" style=\"width:147px;height:123px;\">\n<h1>Air Force Cyber Defense STEM Scores</h1>\n <table align=\"middle\" style=\"width:100%%\">\n\t\t<tr>\n\t\t<th>Team name</th>\n\t\t<th>Score</th>\n\t\t</tr>\n")
	for i := 1; i < len(os.Args)-2; i++ {
		WebpageText1 := []byte("\t\t<tr>\n\t\t<td>")
		WebpageText2 := os.Args[i]
		WebpageText3 := []byte("</td>\n\t\t<td>")
		WebpageText4 := []byte(strconv.Itoa(score[i]))
		WebpageText5 := []byte("</td>\n\t\t</tr>\n\t\t<tr>\n")
		FullWebpage = append(FullWebpage, WebpageText1...)
		FullWebpage = append(FullWebpage, WebpageText2...)
		FullWebpage = append(FullWebpage, WebpageText3...)
		FullWebpage = append(FullWebpage, WebpageText4...)
		FullWebpage = append(FullWebpage, WebpageText5...)
	}
	WebpageText6 := []byte("</td>\n\t\t</tr>\n</table>\n\n</body>\n</html>")
	FullWebpage = append(FullWebpage, WebpageText6...)

	ioutil.WriteFile("/var/www/html/index.html", FullWebpage, 0644)
	//you can run the above code directly
	//err2 :=
	//if err2 != nil {}

}
