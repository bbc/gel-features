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
      When I check the promo is a link
      Then it fails

    @html @automated
    Scenario: Promo contains a non-semantic element with no role to link to other content
      Given a .gef-promo with the code:
        """
        <div class="gef-promo-content">
          <span class="gef-promo-headline"><!-- javascript activated -->Amazing content</span>
        </div>
        """
      When I check the promo is a link
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
    Scenario: Promo contains coloured text against a background image
      Given I am performing a manual test of "Promo: A promo must contain text that contrasts sufficiently with the element behind that text":
      And I have been asked "Does the promo text contrast sufficiently with the element behind it?
      When I answer "Yes"
      Then the manual test passes
      
    @html @manual
    Scenario: Promo contains coloured text against a background image
      Given I am performing a manual test of "Promo: A promo must contain text that contrasts sufficiently with the element behind that text":
      And I have been asked "Does the promo text contrast sufficiently with the element behind it?
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
    Scenario: Promo contains an inline image with alt text
      Given I am performing a manual test of "Promo: A promo with an inline image must include an alt attribute on the image element":
      And I have been asked "Is the promo image alt text appropriate for the image and context?
      When I answer "Yes"
      Then the manual test passes
      
    @html @manual
    Scenario: Promo contains an inline image with alt text
      Given I am performing a manual test of "Promo: A promo with an inline image must include an alt attribute on the image element":
      And I have been asked "Is the promo image alt text appropriate for the image and context?
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
     

