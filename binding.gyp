{
	"targets": [
		{
			"target_name": "sort",
			"include_dirs": [
				"<!(node -e \"require('nan')\")",
				"./native/"
			],
			"sources": ["native/sort.cc", "native/worker.cc"]
		}
	]
}