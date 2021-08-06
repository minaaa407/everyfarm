package kr.co.everyfarm.board;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
  public static void fileUpload(MultipartFile fileData, String path, String fileName) throws IOException {
    String originalFileName = fileData.getOriginalFilename();
    String contentType = fileData.getContentType();
    long fileSize = fileData.getSize();
    InputStream is = null;
    OutputStream out = null;
    try {
      if (fileSize > 0L) {
        is = fileData.getInputStream();
        File realUploadDir = new File(path);
        if (!realUploadDir.exists())
          realUploadDir.mkdirs(); 
        out = new FileOutputStream(String.valueOf(path) + "/" + fileName);
        FileCopyUtils.copy(is, out);
      } else {
      
      } 
    } catch (IOException e) {
      e.printStackTrace();
    } finally {
      if (out != null)
        out.close(); 
      if (is != null)
        is.close(); 
    } 
  }
}
