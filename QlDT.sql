-- 1. B?ng hãng s?n xu?t
CREATE TABLE tHangSX (
    MaHangSX VARCHAR2(10) PRIMARY KEY,
    TenHangSX VARCHAR2(50) NOT NULL,
    QuocGia VARCHAR2(30)
);

-- 2. B?ng lo?i s?n ph?m
CREATE TABLE tLoaiSP (
    MaLoaiSP VARCHAR2(10) PRIMARY KEY,
    TenLoaiSP VARCHAR2(50) NOT NULL
);

-- 3. Danh m?c ?i?n tho?i
CREATE TABLE tDanhMucSP (
    MaSP VARCHAR2(10) PRIMARY KEY,
    TenSP VARCHAR2(100) NOT NULL,
    Model VARCHAR2(50),
    Gia NUMBER NOT NULL,
    ChietKhau NUMBER DEFAULT 0,
    MaHangSX VARCHAR2(10),
    MaLoaiSP VARCHAR2(10),
    AnhDaiDien VARCHAR2(200),
    CONSTRAINT fk_dm_hang FOREIGN KEY (MaHangSX) REFERENCES tHangSX(MaHangSX),
    CONSTRAINT fk_dm_loai FOREIGN KEY (MaLoaiSP) REFERENCES tLoaiSP(MaLoaiSP)
);

-- 4. B?ng màu s?c
CREATE TABLE tMauSac (
    MaMau VARCHAR2(10) PRIMARY KEY,
    TenMau VARCHAR2(30) NOT NULL
);

-- 5. B?ng b? nh?/kích th??c
CREATE TABLE tKichThuoc (
    MaKT VARCHAR2(10) PRIMARY KEY,
    MoTa VARCHAR2(20) NOT NULL  -- 64GB, 128GB, 256GB
);

-- 6. Chi ti?t s?n ph?m (bi?n th?)
CREATE TABLE tChiTietSanPham (
    MaChiTietSP VARCHAR2(10) PRIMARY KEY,
    MaSP VARCHAR2(10),
    MaKT VARCHAR2(10),
    MaMau VARCHAR2(10),
    SoLuongTon NUMBER DEFAULT 0,
    GiaBan NUMBER,
    GiamGia NUMBER DEFAULT 0,
    AnhChiTiet VARCHAR2(200),
    Video VARCHAR2(200),
    CONSTRAINT fk_ctsp_sp FOREIGN KEY (MaSP) REFERENCES tDanhMucSP(MaSP),
    CONSTRAINT fk_ctsp_kt FOREIGN KEY (MaKT) REFERENCES tKichThuoc(MaKT),
    CONSTRAINT fk_ctsp_mau FOREIGN KEY (MaMau) REFERENCES tMauSac(MaMau)
);

-- 7. Nhân viên
CREATE TABLE tNhanVien (
    MaNV VARCHAR2(10) PRIMARY KEY,
    TenNV VARCHAR2(50) NOT NULL,
    SDT VARCHAR2(15),
    DiaChi VARCHAR2(100),
    ChucVu VARCHAR2(30),
    AnhDaiDien VARCHAR2(200),
    GhiChu VARCHAR2(200)
);

-- 8. Khách hàng
CREATE TABLE tKhachHang (
    MaKH VARCHAR2(10) PRIMARY KEY,
    Username VARCHAR2(30) UNIQUE,
    TenKH VARCHAR2(50) NOT NULL,
    NgaySinh DATE,
    SDT VARCHAR2(15),
    DiaChi VARCHAR2(100),
    LoaiKH VARCHAR2(20),
    AnhDaiDien VARCHAR2(200),
    GhiChu VARCHAR2(200)
);

-- 9. Tài kho?n user h? th?ng (nhân viên login)
CREATE TABLE tUser (
    Username VARCHAR2(30) PRIMARY KEY,
    Password VARCHAR2(100) NOT NULL,
    MaNV VARCHAR2(10),
    Role VARCHAR2(20),
    CONSTRAINT fk_user_nv FOREIGN KEY (MaNV) REFERENCES tNhanVien(MaNV)
);

-- 10. Hóa ??n bán
CREATE TABLE tHoaDonBan (
    MaHD VARCHAR2(10) PRIMARY KEY,
    NgayHD DATE DEFAULT SYSDATE,
    MaKH VARCHAR2(10),
    MaNV VARCHAR2(10),
    TongTien NUMBER,
    GiamGia NUMBER DEFAULT 0,
    PhuongThucTT VARCHAR2(20),
    MaSoThue VARCHAR2(20),
    TongTienThue NUMBER,
    GhiChu VARCHAR2(200),
    CONSTRAINT fk_hd_kh FOREIGN KEY (MaKH) REFERENCES tKhachHang(MaKH),
    CONSTRAINT fk_hd_nv FOREIGN KEY (MaNV) REFERENCES tNhanVien(MaNV)
);

-- 11. Chi ti?t hóa ??n
CREATE TABLE tChiTietHDB (
    MaHD VARCHAR2(10),
    MaChiTietSP VARCHAR2(10),
    SoLuong NUMBER NOT NULL,
    DonGiaBan NUMBER,
    GiamGia NUMBER DEFAULT 0,
    ThanhTien NUMBER,
    GhiChu VARCHAR2(200),
    PRIMARY KEY (MaHD, MaChiTietSP),
    CONSTRAINT fk_cthd_hd FOREIGN KEY (MaHD) REFERENCES tHoaDonBan(MaHD),
    CONSTRAINT fk_cthd_sp FOREIGN KEY (MaChiTietSP) REFERENCES tChiTietSanPham(MaChiTietSP)
);
-- 1. Insert hãng s?n xu?t
INSERT INTO tHangSX (MaHangSX, TenHangSX, QuocGia)
VALUES ('H01', 'Apple', 'USA');

-- 2. Insert lo?i s?n ph?m
INSERT INTO tLoaiSP (MaLoaiSP, TenLoaiSP)
VALUES ('L01', 'Smartphone');

-- 3. Insert s?n ph?m ?i?n tho?i
INSERT INTO tDanhMucSP (MaSP, TenSP, Model, Gia, ChietKhau, MaHangSX, MaLoaiSP, AnhDaiDien)
VALUES ('SP01', 'iPhone 15 Pro', 'A3102', 28000000, 5, 'H01', 'L01', 'iphone15pro.png');

-- 4. Insert màu s?c
INSERT INTO tMauSac (MaMau, TenMau)
VALUES ('M01', 'Titan Blue');

-- 5. Insert b? nh?/kích th??c
INSERT INTO tKichThuoc (MaKT, MoTa)
VALUES ('KT1', '256GB');
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello PLSQL');
END;

