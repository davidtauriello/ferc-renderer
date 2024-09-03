# ferc-xendr-rulesets
 Rulesets to render Ferc forms using xendr an upgrade to ferc-renderer
# FERC eForms Renderer

To render forms using the Arelle processor, the XULE plugin and FERC render plugin are used.

## <a name="deploying"></a>Deploying the FERC eForms renderer plugin for Arelle
### Windows/Mac/Linux Application Install
1. Download the latest version of [Arelle](http://arelle.org/pub/) to your environment and install. 
2. Download the latest [XULE release](https://github.com/xbrlus/xule/releases) 
3. Extract the archive and copy the ```plugin/xule``` folder and files and ```plugin/FERC``` folder and files to the plugin directory of Arelle in your environment (if prompted, overwrite files in the existing xule subfolder). In a Windows environment, this would be located on a path similar to C:\Program Files\Arelle\plugin; on a Mac, the location would be at /Applications/Arelle.app/Contents/MacOS/plugin. 

### Source Install
* Download the latest version of [Arelle](https://github.com/Arelle/Arelle/) from GitHub to your environment and install. 
* Install the following modules to python:
  * isodate
  * aniso8601
  * numpy
* Follow steps 2 and 3 from the **Windows/Mac/Linux Application Install** section above to add the xule and FERC plugin folders and files to the plugin directory of Arelle. The Arelle location is where the Arelle source code from GitHub was extracted on the local machine or server. The Arelle plugin foler is at ```arelle/plugin``` in the source distribution. For *step 2*, add the xule and FERC folders and files to the ```arelle/plugin``` folder.

The FERC plugin requires **Python 3.10** or later and is **not compatible with earlier versions of Python**.

## Rendering a Filing

A file is rendered as a FERC form by providing the FERC renderer with the XBRL Instance document and a template set. The renderer takes the instance and the template set and generates an inline XBRL file formatted as a traditional FERC form. This document is not filed with the FERC but is used as a tool by filers and users to make the filing human readable.  This file can be used for reviewing the actual filing in a familar format.

The FERC publihes different template sets for each form, including different template sets for annual and quarterly filings. Depending on the form and form period being reported a different template set should be used. 

In addition the FERC publishes seperate template sets for individual schedules.  This means a single schedule can be rendered for review rather than rendering the entire form.

The templates can also be used from this repository with the Arelle command below as the ferc-render-template-set parameter:

- Form 1: https://github.com/xbrlus/ferc-xendr-rulesets/raw/main/Form1/combined/RenderingTemplates_Form1.zip
- Form 1F: https://github.com/xbrlus/ferc-xendr-rulesets/raw/main/Form1/combined/RenderingTemplates_Form1F.zip
- Form 1 3Q Electric: https://github.com/xbrlus/ferc-xendr-rulesets/raw/main/Form1/combined/RenderingTemplates_Form1Q.zip
- Form 2: https://github.com/xbrlus/ferc-xendr-rulesets/raw/main/Form2/combined/RenderingTemplates_Form2.zip
- Form 2A: https://github.com/xbrlus/ferc-xendr-rulesets/raw/main/Form2/combined/RenderingTemplates_Form2A.zip
- Form 2 3Q Gas: https://github.com/xbrlus/ferc-xendr-rulesets/raw/main/Form2/combined/RenderingTemplates_Form2Q.zip
- Form 6: https://github.com/xbrlus/ferc-xendr-rulesets/raw/main/Form6/combined/RenderingTemplates_Form6.zip
- Form 6Q: https://github.com/xbrlus/ferc-xendr-rulesets/raw/main/Form6/combined/RenderingTemplates_Form6Q.zip
- Form 60: https://github.com/xbrlus/ferc-xendr-rulesets/raw/main/Form60/combined/RenderingTemplates_Form60.zip
- Form 714: https://github.com/xbrlus/ferc-xendr-rulesets/raw/main/Form714/combined/RenderingTemplates_Form714.zip

### Arelle Commands to render the filing
The command to generate a rendered filing is as follows (exclude the _{location}_ text - this is illustrative of which file is referenced):
`python3 Arelle-master/arellecmdline.py --plugin FERC/render --ferc-render-render --ferc-render-template-set {location of template}https://github.com/xbrlus/ferc-xendr-rulesets/raw/main/Form1/combined/RenderingTemplates_Form2.zip -f {location of instance}https://raw.githubusercontent.com/xbrlus/ferc-xendr-rulesets/main/Form2/sampleInstances/Sample_Form_2.xbrl' --ferc-render-inline {location of output}/sample-combined.html --noCertificateCheck --ferc-render-debug`

This will refer to an external CSS file in the template. To include the css file in the rendered file the following options are used:

 ``--ferc-render-css-file = FERC_RENDER_CSS_FILE``
 
                        Identify the CSS file that sould be used. This will
                        overwrite the name of the CSS file that is included in
                        the template set.
                        
                        
 ``--ferc-render-inline-css``
  
                        Indicates that the CSS should be inlined in the
                        generated HTML file. This option must be used with
                        --ferc-render-css-file.

These two options should be used by default.  To include FERC rendering CSS styles from the template in the head your rendered HTML, use ``--ferc-render-css-file = form-template.css`` along with the ``--ferc-render-inline-css`` command.  Excluding the ``--ferc-render-inline-css`` will generate a separate CSS file linked within the HTML. All FERC rendering templates use **form-template.css** as the default name for CSS files.

### Arelle Commands to render the HTML without an instance
`.\arellecmdline.exe --plugin FERC/render --ferc-render-render --ferc-render-template-set https://github.com/xbrlus/ferc-xendr-rulesets/raw/main/Form1/combined/RenderingTemplates_Form2.zip -f https://ecollection.ferc.gov/taxonomy/form2/2024-04-01/form/form2/form-2_2024-04-01.xsd --ferc-render-css-file {Location of CSS - this is in Arelle's FERC plugin folder}form-template.css --ferc-render-inline-css --ferc-render-inline {Location of output}/inline.html --noCertificateCheck --ferc-render-debug`
