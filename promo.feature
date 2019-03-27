Feature: Promo

  The Promo component is used to advertise BBC content. Principally it is a link to that content, but 
  it can include a combination of supporting content to draw the reader's attention. Full details are 
  outlined on the GEL and GEF Promo pages.
  
  
  Requirement: A promo must contain a link to other content
  
    @html @automated
    Scenario: Promo contains a link to other content
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      When I check the promo contains a link
      Then it passes

    @html @automated
    Scenario: Promo contains a button linking to other content
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <button class="gef-promo-headline"><!-- javascript activated -->Amazing content</button>
        </div>
        """
      When I check the promo contains a link
      Then it fails

    @html @automated
    Scenario: Promo contains a non-semantic element with a link role to link to other content
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <span class="gef-promo-headline" role="link"><!-- javascript activated -->Amazing content</span>
        </div>
        """
      When I check the promo contains a link
      Then it fails

    @html @automated
    Scenario: Promo contains a non-semantic element with no role to link to other content
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <span class="gef-promo-headline"><!-- javascript activated -->Amazing content</span>
        </div>
        """
      When I check the promo contains a link
      Then it fails
  
  
  Requirement: A promo's link text must resemble the target page's title or main heading
  
    @html @automated
    Scenario: Promo contains a link with text
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      When I check the promo link contains text
      Then it requests a manual check for the scenario "Promo link has text"
      
    @html @manual
    Scenario: Promo link has text that may be appropriate
      Given I am performing a manual test of "Promo: A promo's link text must resemble the target page's title or main heading"
      And I have been asked "Does the link text resemble the title or main heading of the target page?"
      When I answer "Yes"
      Then the manual test passes
      
    @html @manual
    Scenario: Promo link has text that may be appropriate
      Given I am performing a manual test of "Promo: A promo's link text must resemble the target page's title or main heading"
      And I have been asked "Does the link text resemble the title or main heading of the target page?"
      When I answer "No"
      Then the manual test fails
      
    @html @automated
    Scenario: Promo contains an empty link element
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content"></a>
        </div>
        """
      When I check the promo link contains text
      Then it fails
      
    @html @automated
    Scenario: Promo contains a link with non-text content
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content"><!-- image or icon --></a>
        </div>
        """
      When I check the promo link contains text
      Then it fails

  
  Requirement: A promo must not contain a heading element
    
    @html @automated
    Scenario: Promo does not contain a heading element
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      When I check the promo does not contain a heading element
      Then it passes
  
    @html @automated
    Scenario: Promo link and text are within a heading element
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <h2><a class="gef-promo-headline" href="path/to/content">Amazing content</a></h2>
        </div>
        """
      When I check the promo does not contain a heading element
      Then it fails
  
    @html @automated
    Scenario: Promo text is within a heading element
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content"><h2>Amazing content</h2></a>
        </div>
        """
      When I check the promo does not contain a heading element
      Then it fails
  
  
  Requirement: A promo must contain text that contrasts sufficiently with the element behind that text
    
    @html @automated
    Scenario: Promo contains coloured text against a suitable background colour
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      And the styles:
        """
        .gef-promo-content { background-color: white; }
        a.gef-promo-headline:link { colour: blue; font-size: 16px; }
        """
      When I check the promo text has sufficient contrast
      Then it passes
      
    @html @automated
    Scenario: Promo contains coloured text against an unsuitable background colour
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      And the styles:
        """
        .gef-promo-content { background-color: black; }
        a.gef-promo-headline:link { colour: blue; font-size: 16px; }
        """
      When I check the promo text has sufficient contrast
      Then it fails
      
    @html @automated
    Scenario: Promo contains coloured text against a suitable background colour plus an image
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      And the styles:
        """
        .gef-promo-content { background-color: white; background-image: url(image.jpg); }
        a.gef-promo-headline:link { colour: blue; font-size: 16px; }
        """
      When I check the promo text has sufficient contrast
      Then it requests a manual check for the scenario "Promo contains coloured text against a background image"
      
    @html @manual
    Scenario: Promo contains coloured text against a background image that may vary in contrast
      Given I am performing a manual test of "Promo: A promo must contain text that contrasts sufficiently with the element behind that text"
      And I have been asked "Does the promo text contrast sufficiently with the element behind it?"
      When I answer "Yes"
      Then the manual test passes
      
    @html @manual
    Scenario: Promo contains coloured text against a background image that may vary in contrast
      Given I am performing a manual test of "Promo: A promo must contain text that contrasts sufficiently with the element behind that text"
      And I have been asked "Does the promo text contrast sufficiently with the element behind it?"
      When I answer "No"
      Then the manual test fails
      
    @html @automated
    Scenario: Promo contains coloured text against an unsuitable background colour plus an image
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      And the styles:
        """
        .gef-promo-content { background-color: black; background-image: url(image.jpg); }
        a.gef-promo-headline:link { colour: blue; font-size: 16px; }
        """
      When I check the promo text has sufficient contrast
      Then it fails
  
  
  Requirement: A promo must contain text that is resizable
    
    @html @automated
    Scenario: Promo contains text sized with relative units
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      And the styles:
        """
        body { font-size: 62.5%; }
        a.gef-promo-headline { font-size: 1.6em; } /* em, ex, ch, rem, vw, vh, vmin, vmax, % */ 
        """
      When I check the promo text is resizable
      Then it passes
    
    @html @automated
    Scenario: Promo contains text sized with absolute units
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      And the styles:
        """
        body { font-size: 10px; }
        a.gef-promo-headline { font-size: 16px; } /* cm, mm, in, px, pt, pc */ 
        """
      When I check the promo text is resizable
      Then it fails
    
    @html @automated
    Scenario: Promo contains text sized with a combination of relative and absolute units
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      And the styles:
        """
        body { font-size: 10px; } /* cm, mm, in, px, pt, pc */
        a.gef-promo-headline { font-size: 1.6em; } /* em, ex, ch, rem, vw, vh, vmin, vmax, % */ 
        """
      When I check the promo text is resizable
      Then it fails
  
  
  Requirement: A promo with an inline image must not include it inside the link element
  
    @html @automated
    Scenario: Promo with an inline image element not within the link element
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <div class="gef-promo-image"><img src="path/to/image" alt=""></div>
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      When I check the promo inline image element is not inside the link element
      Then it passes
  
    @html @automated
    Scenario: Promo with an inline image element within the link element
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">
            <div class="gef-promo-image"><img src="path/to/image" alt=""></div>
            <div class="promo-headline">Amazing content</div>
          </a>
        </div>
        """
      When I check the promo inline image element is not inside the link element
      Then it fails
  
  
  Requirement: A promo with an inline image must include an alt attribute on the image element
   
    @html @automated
    Scenario: Promo contains an inline image element with an empty alt attribute
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <div class="gef-promo-image"><img src="path/to/image" alt=""></div>
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      When I check the promo inline image element has an alt attribute
      Then it passes
      
    @html @automated
    Scenario: Promo contains an inline image element with an alt attribute that matches the source file name
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <div class="gef-promo-image"><img src="path/to/image.jpg" alt="image.jpg"></div>
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      When I check the promo inline image element has an alt attribute
      Then it fails
      
    @html @automated
    Scenario: Promo contains an inline image element with an alt attribute that includes unnecessary words
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <div class="gef-promo-image"><img src="path/to/image.jpg" alt="image of amazing thing"></div>
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      When I check the promo inline image element has an alt attribute
      Then it fails
      
    @html @automated
    Scenario: Promo contains an inline image element with a non-empty alt attribute
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <div class="gef-promo-image"><img src="path/to/image" alt="amazing thing"></div>
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      When I check the promo inline image element has an alt attribute
      Then it requests a manual check for the scenario "Promo contains an inline image with alt text"
      
    @html @manual
    Scenario: Promo contains an inline image with alt text that may be appropriate
      Given I am performing a manual test of "Promo: A promo with an inline image must include an alt attribute on the image element"
      And I have been asked "Is the promo image alt text appropriate for the image and context?"
      When I answer "Yes"
      Then the manual test passes
      
    @html @manual
    Scenario: Promo contains an inline image with alt text that may be appropriate
      Given I am performing a manual test of "Promo: A promo with an inline image must include an alt attribute on the image element"
      And I have been asked "Is the promo image alt text appropriate for the image and context?"
      When I answer "No"
      Then the manual test fails
     
    @html @automated
    Scenario: Promo contains an element with a background image
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <div class="gef-promo-image" style="background-image:url(image.jpg)"></div>
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      When I check the promo inline image element has an alt attribute
      Then it is not applicable
  
  
  Requirement: A promo must indicate if it links to an alternative format
   
    @html @automated
    Scenario: Promo indicates it links to a different format
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <div class="gef-promo-image">
            <img src="path/to/image" alt="">
            <div class="gef-promo__indicator" aria-hidden="true"><!-- PDF SVG icon --></div>
          </div>
          <a class="gef-promo-headline" href="path/to/content.pdf">Amazing content (PDF, 2.3Mb)</a>
        </div>
        """
      When I check the promo indicates it links to an alternative format
      Then it passes
   
    @html @automated
    Scenario: Promo does not indicate it links to a different format
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <div class="gef-promo-image"><img src="path/to/image" alt=""></div>
          <a class="gef-promo-headline" href="path/to/content.pdf">Amazing content</a>
        </div>
        """
      When I check the promo indicates it links to an alternative format
      Then it fails
   
    @html @automated
    Scenario: Promo links to a video page
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <div class="gef-promo-image">
            <img src="path/to/image" alt="">
            <div class="gef-promo__indicator" aria-hidden="true"><!-- Play SVG icon --></div>
          </div>
          <a class="gef-promo-headline" href="path/to/content">Amazing content (Video, 1:42 minutes)</a>
        </div>
        """
      When I check the promo indicates it links to an alternative format
      Then it is not applicable
  
  
  Requirement: A promo with a media indicator must do so visually and to assistive technology
   
    @html @automated
    Scenario: Promo indicates a type of media content it links to
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <div class="gef-promo-image">
            <img src="path/to/image" alt="">
            <div class="gef-promo__indicator" aria-hidden="true"><!-- Play SVG icon --></div>
          </div>
          <a class="gef-promo-headline" href="path/to/content">Amazing content (Video, 1:42 minutes)</a>
        </div>
        """
      When I check the promo indicates it links to an alternative format
      Then it passes
   
    @html @automated
    Scenario: Promo indicates a type of media content it links to
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <div class="gef-promo-image">
            <img src="path/to/image" alt="">
            <div class="gef-promo__indicator" aria-hidden="true"><!-- Play SVG icon --></div>
          </div>
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      When I check the promo indicates it links to an alternative format
      Then it fails
     

  Requirement: A promo with a description must not include it inside the link element
  
    @html @automated
    Scenario: Promo with a description not within the link element
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
          <p>You really want to check it out!</p>
        </div>
        """
      When I check the promo description is not inside the link element
      Then it passes
  
    @html @automated
    Scenario: Promo with a description within the link element
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">
            <div class="promo-headline">Amazing content</div>
            <p>You really want to check it out!</p>
          </a>
        </div>
        """
      When I check the promo description is not inside the link element
      Then it fails
  
  
  Requirement: A promo must be a large enough touch target
    
    @html @automated
    Scenario: Promo is large enough
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      And the styles:
        """
        body { font-size:10px; }
        a.gef-promo-headline { font-size: 1.6em; padding: 0.5em; } /* minimum height and width of 32px */
        """
      When I check the promo target size is large enough
      Then it passes
    
    @html @automated
    Scenario: Promo is not large enough
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      And the styles:
        """
        body { font-size:62.5%; }
        a.gef-promo-headline { font-size: 1.6em; }
        """
      When I check the promo target size is large enough
      Then it fails
  
  
  Requirement: A promo must indicate that it is interactive
  
    @html @manual
    Scenario: Promo may appear to be interative
      Given I am performing a manual test of "Promo: A promo must indicate that it is interactive"
      And I have been asked "Does the promo look like something to interactive with?"
      When I answer "Yes"
      Then the manual test passes
      
    @html @manual
    Scenario: Promo may appear to be interactive
      Given I am performing a manual test of "Promo: A promo must indicate that it is interactive"
      And I have been asked "Does the promo look like something to interactive with?"
      When I answer "No"
      Then the manual test fails
  
  
  Requirement: A promo must be able to receive focus
  
  It may be possible to automate this by checking a promo is included in the browser tabindex list.
  
    @html @manual
    Scenario: Promo may be able to receive focus
      Given I am performing a manual test of "Promo: A promo must be able to receive focus"
      And I have been asked "Can keyboard focus move to the promo and away from the promo?"
      When I answer "Yes"
      Then the manual test passes
      
    @html @manual
    Scenario: Promo may be able to receive focus
      Given I am performing a manual test of "Promo: A promo must be able to receive focus"
      And I have been asked "Can keyboard focus move to the promo and away from the promo?"
      When I answer "No"
      Then the manual test fails
  
  
  Requirement: A promo must change visibly when focused on and hovered over
    
    @html @automated
    Scenario: Promo changes appearance on focus and hover
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      And the styles:
        """
        a.gef-promo-headline:link, a.gef-promo-headline:visited { colour: blue; text-decoration: none; font-weight: bold; }
        a.gef-promo-headline:hover, a.gef-promo-headline:focus { colour: purple; text-decoration: underline; }
        """
      When I check the promo changes visibly on focus and hover
      Then it passes
    
    @html @automated
    Scenario: Promo changes appearance on focus and hover
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <a class="gef-promo-headline" href="path/to/content">Amazing content</a>
        </div>
        """
      And the styles:
        """
        a.gef-promo-headline:link { colour: blue; text-decoration: none; font-weight: bold; }
        a.gef-promo-headline:hover { colour: purple; text-decoration: underline; }
        """
      When I check the promo changes visibly on focus and hover
      Then it fails

