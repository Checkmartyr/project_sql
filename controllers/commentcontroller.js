
module.exports = async (req, res) => {
    const commentText = req.body.commentText;
    const user = req.session.userId;// Change to your actual user ID source
    const drawingId = req.params.id;
    const uid = req.query.author
   
    // Assuming CommentDate is generated by the database using DEFAULT CURRENT_TIMESTAMP
    console.log(user);
    console.log(uid);
    const insertQuery = 'INSERT INTO comment (UserID, DrawingID, CommentText) VALUES (?, ?, ?)';
    const postComments = await queryMySQL(insertQuery , [user, drawingId, commentText]);

      if (!postComments) {
        console.error('Error creating comment:');
        return res.status(500).send('Internal Server Error');
      }
      console.log(postComments);
      console.log('Comment created successfully');
      res.redirect(`/manu`);
    }
  
// module.exports = (req,res)=>{
//     console.log("req.body",req.body);
//     console.log("req.query",req.query);
//     console.log("req.params",req.params);
    
//     Comment.create({commentText:req.body.commentText, author:req.query.author,Drawing:req.params.id}).catch((error)=>{
//         console.log(error)
//     })

//     res.redirect(`/manu`)

// }