module TestData
 
   def list_forums()
   @forums = []
    @forums.push Forum.new
    @forums[0].id = 0
    @forums[0].name = "ART"
    @forums[0].image = "icons/art_icon.svg"
    
    @forums.push Forum.new
    @forums[1].id = 1
    @forums[1].name = "BIO"
     @forums[1].image = "icons/bio_icon.svg"
     
     @forums.push Forum.new
    @forums[2].id = 2
    @forums[2].name = "CHE"
     @forums[2].image = "icons/che_icon.svg"
     
     @forums.push Forum.new
    @forums[3].id = 3
    @forums[3].name = "CSC"
     @forums[3].image = "icons/csc_icon.svg"
     
     return @forums;
   end
   
   def list_questions()
       @popQs = []
    @popQs.push Question.new
    @popQs[0].id = 0
    @popQs[0].forum = Forum.new;
    @popQs[0].forum.name = "CSC"
    @popQs[0].forum.id = 3
    @popQs[0].title = "What is the difference between C and C++?"
    @popQs[0].author = "Stuart Perry"
    @popQs[0].created_on = "1/15/2017 11:43PM"
    @popQs[0].num_answers = 50
    @popQs[0].description = "In non faucibus lacus. Praesent vitae rhoncus quam. Mauris tempus ex eu diam dictum, interdum vehicula eros tincidunt. Sed eu nunc vestibulum neque pharetra condimentum at a orci. Curabitur iaculis enim et condimentum ultricies. Ut ut mattis eros. Proin finibus tempus auctor. Aliquam egestas interdum leo, ac sollicitudin tortor rutrum in. Pellentesque sit amet neque efficitur elit egestas euismod sit amet vitae neque.

Sed in diam sit amet lacus malesuada fringilla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consequat risus lacinia tincidunt varius. Ut rutrum sapien cursus erat commodo rhoncus. Phasellus turpis purus, condimentum non risus quis, interdum vulputate mauris."
    
     @popQs.push Question.new
     @popQs[1].id = 1
     @popQs[1].forum = Forum.new;
    @popQs[1].forum.name = "BIO"
    @popQs[1].forum.id = 1
    @popQs[1].title = "How do I recognize a coral snake?"
    @popQs[1].author = "Abby Smith"
    @popQs[1].created_on = "3/5/2017 3:27AM"
    @popQs[1].num_answers = 2
     @popQs[1].description = "Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean a ultrices tortor. Mauris sagittis lacus sed neque tincidunt efficitur. Maecenas eget est egestas, consectetur nibh ac, iaculis eros. Cras et pharetra nibh, et sollicitudin velit. Donec id dapibus urna. Donec scelerisque cursus cursus."
    
    @popQs.push Question.new
     @popQs[2].id = 2
     @popQs[2].forum = Forum.new;
    @popQs[2].forum.name = "CHE"
    @popQs[2].forum.id = 2
    @popQs[2].title = "This is a really really long 
    question title to test how overflow works when 
    question stitles get really long. That wasn't long enough.
    I mean seriosuly long. What does it look like?"
    @popQs[2].author = "Jeremiah Pumblesnook"
    @popQs[2].created_on = "2/6/2017 4:30PM"
    @popQs[2].num_answers = 7
    @popQs[2].description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nulla nibh, pulvinar euismod molestie id, maximus non felis. Pellentesque faucibus egestas magna, non molestie mauris. Aliquam maximus lectus tortor, sit amet gravida nibh rhoncus nec. Aenean imperdiet non orci sed condimentum. Suspendisse ligula nulla, dapibus fringilla ipsum eget, tempus imperdiet libero. Vestibulum non lectus at lorem fermentum lacinia vestibulum et nisl. Praesent cursus orci lorem, vestibulum hendrerit metus posuere id. Integer congue tellus euismod, maximus nisl eget, porta velit. Etiam nec bibendum lectus. Praesent elementum sapien id velit iaculis scelerisque ut a dui." 
    return @popQs
   end
   
end
