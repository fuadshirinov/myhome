package com.myhome.domain;

import java.io.InputStream;

public class Media extends MyHomeBase {

    private String filename;
    private String originalFileName;
    private String mimeType;
    private long fileLength;
    private long advId;
    private boolean main;
    private InputStream inputStream;

    public Media() {
        this.filename = "";
        this.originalFileName = "";
        this.mimeType = "";
        this.fileLength = 0;
        this.advId = 0;
        this.main = true;
        this.inputStream = null;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getOriginalFileName() {
        return originalFileName;
    }

    public void setOriginalFileName(String originalFileName) {
        this.originalFileName = originalFileName;
    }

    public String getMimeType() {
        return mimeType;
    }

    public void setMimeType(String mimeType) {
        this.mimeType = mimeType;
    }

    public long getFileLength() {
        return fileLength;
    }

    public void setFileLength(long fileLength) {
        this.fileLength = fileLength;
    }

    public long getAdvId() {
        return advId;
    }

    public void setAdvId(long advId) {
        this.advId = advId;
    }

    public boolean isMain() {
        return main;
    }

    public void setMain(boolean main) {
        this.main = main;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    @Override
    public String toString() {
        return "Media{" +
                "filename='" + filename + '\'' +
                ", originalFileName='" + originalFileName + '\'' +
                ", mimeType='" + mimeType + '\'' +
                ", fileLength=" + fileLength +
                ", advId=" + advId +
                ", main=" + main +
                ", inputStream=" + inputStream +
                '}';
    }

}
