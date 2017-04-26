using System;
using Mono.Addins;
using Mono.Addins.Description;

[assembly: Addin (
	"DefaultDesigner",
	Namespace = "DefaultDesigner",
	Version = "1.2"
)]

[assembly: AddinName ("Default Designer")]
[assembly: AddinCategory ("IDE extensions")]
[assembly: AddinDescription ("Open xib and storyboard files with Xcode Interface Builder by default")]
[assembly: AddinAuthor ("Colby Williams")]
