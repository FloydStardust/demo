package com.example.controller;

import com.example.entity.Leads;
import com.example.util.LeadsUtils;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * Description: file controller
 * Created by Floyd on 2019/2/26 16:34
 */
@RestController
@RequestMapping("file")
public class FileController {

    @PostMapping("/bp/{id}")
    public ResultData singleBPUpload(@RequestParam(value = "file") MultipartFile file, @PathVariable int id){
        String basePath = LeadsUtils.UPLOAD_BP_PATH + id;
        findDir(basePath);
//        Path path = Paths.get(basePath + "\\" + file.getOriginalFilename());
        Path path = Paths.get(basePath + "/" + file.getOriginalFilename());
        return saveFile(file, path);
    }
    @PostMapping("/record/{id}")
    public ResultData singleRecordUpload(@RequestParam(value = "file") MultipartFile file, @PathVariable int id){
        String basePath = LeadsUtils.UPLOAD_RECORD_PATH + id;
        System.out.println(file);
        findDir(basePath);
//        Path path = Paths.get(basePath + "\\" + file.getOriginalFilename());
        Path path = Paths.get(basePath + "/" + file.getOriginalFilename());
        return saveFile(file, path);
    }

    @GetMapping("/download/{type}/{id}")
    public void download(HttpServletResponse response, @PathVariable String type, @PathVariable int id){
        String dirc = "";
        String subZipPath = "";
        if(type.equals("bp")){
            dirc = LeadsUtils.UPLOAD_BP_PATH + id;
//            subZipPath =
        }else if(type.equals("record")){
            dirc = LeadsUtils.UPLOAD_RECORD_PATH + id;
        }
        File directoryFile = new File(dirc);
        File[] fileList = directoryFile.listFiles();
        if(!directoryFile.isDirectory() && !directoryFile.exists()){
            return;
        }
        //设置最终输出zip文件的目录+文件名
        SimpleDateFormat formatter  = new SimpleDateFormat("yyyy-MM-dd");
        String zipFileName = formatter.format(new Date())+"-"+type+".zip";
        String strZipPath = dirc+"\\"+zipFileName;

        ZipOutputStream zipStream = null;
        FileInputStream zipSource = null;
        BufferedInputStream bufferStream = null;
        File zipFile = new File(strZipPath);
        try{
            //构造最终压缩包的输出流
            zipStream = new ZipOutputStream(new FileOutputStream(zipFile));
            for (File file : fileList){
                //解码获取真实路径与文件名
                String realFileName = java.net.URLDecoder.decode(file.getName(),"UTF-8");
                String realFilePath = java.net.URLDecoder.decode(file.getAbsolutePath(),"UTF-8");
                zipSource = new FileInputStream(file);//将需要压缩的文件格式化为输入流
                /**
                 * 压缩条目不是具体独立的文件，而是压缩包文件列表中的列表项，称为条目，就像索引一样这里的name就是文件名,
                 * 文件名和之前的重复就会导致文件被覆盖
                 */
                ZipEntry zipEntry = new ZipEntry(realFileName);//在压缩目录中文件的名字
                zipStream.putNextEntry(zipEntry);//定位该压缩条目位置，开始写入文件到压缩包中
                bufferStream = new BufferedInputStream(zipSource, 1024 * 10);
                int read = 0;
                byte[] buf = new byte[1024 * 10];
                while((read = bufferStream.read(buf, 0, 1024 * 10)) != -1)
                {
                    zipStream.write(buf, 0, read);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //关闭流
            try {
                if(null != bufferStream) bufferStream.close();
                if(null != zipStream){
                    zipStream.flush();
                    zipStream.close();
                }
                if(null != zipSource) zipSource.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        //判断系统压缩文件是否存在：true-把该压缩文件通过流输出给客户端后删除该压缩文件  false-未处理
        if(zipFile.exists()){
            downImg(response,zipFileName,strZipPath);
            zipFile.delete();
        }
    }

    public void downImg(HttpServletResponse response,String filename,String path ){
        if (filename != null) {
            FileInputStream is = null;
            BufferedInputStream bs = null;
            OutputStream os = null;
            try {
                File file = new File(path);
                if (file.exists()) {
                    //设置Headers
                    response.setHeader("Content-Type","application/octet-stream");
                    //设置下载的文件的名称-该方式已解决中文乱码问题
                    response.setHeader("Content-Disposition","attachment;filename=" +  new String( filename.getBytes("gb2312"), "ISO8859-1" ));
                    is = new FileInputStream(file);
                    bs =new BufferedInputStream(is);
                    os = response.getOutputStream();
                    byte[] buffer = new byte[1024];
                    int len = 0;
                    while((len = bs.read(buffer)) != -1){
                        os.write(buffer,0,len);
                    }
                }
            }catch(IOException ex){
                ex.printStackTrace();
            }finally {
                try{
                    if(is != null){
                        is.close();
                    }
                    if( bs != null ){
                        bs.close();
                    }
                    if( os != null){
                        os.flush();
                        os.close();
                    }
                }catch (IOException e){
                    e.printStackTrace();
                }
            }
        }
    }

    private void findDir(String path){
        File file = new File(path);
        if (!file.exists()) {
            file.mkdirs();
        }
    }

    private ResultData saveFile(MultipartFile file, Path path){
        ResultData resultData = new ResultData();
        if (file.isEmpty()) {
            resultData.setResponseCode(ResponseCode.RESPONSE_NULL);
            resultData.setDescription("Please select a file to upload (*´д`)");
        }
        try {
            // Get the file and save it somewhere
            byte[] bytes = file.getBytes();
            Files.write(path, bytes);
            resultData.setResponseCode(ResponseCode.RESPONSE_OK);
            resultData.setDescription("Upload files successfully ~ (ゝ∀･)b");
        } catch (IOException e) {
            resultData.setResponseCode(ResponseCode.RESPONSE_ERROR);
            resultData.setDescription("Background saving error occurs...(╥﹏╥)");
            e.printStackTrace();
        }
        return resultData;
    }
}
