#include<iostream>
using namespace std;
//=========================KHAI BAO CAU TRUC CUA DANH SACH LIEN KET DON============================

// khai bao cau truc cua node
struct node {
	int data;//du lieu chua trong 1 node
	struct node* pNext; //con tro dung de lien ket cac node lai voi nhau
};
typedef struct node NODE;

// khai bao cau truc quan li cua danh sach lien ket don 
struct list {
	NODE* pHead;// node quan li dau danh sach
	NODE* pTail;// node quan li cuoi danh sach
};
typedef struct list LIST;

//=========================KHOI TAO CAU TRUC CUA DANH SACH LIEN KET DON============================

// khoi tao danh sach
void KhoiTao(LIST& l) {
	l.pHead = NULL;
	l.pTail = NULL;
}

// ham khoi tao mot node
NODE* KhoiTaoNode(int x) {
	NODE* p = new NODE; // cap phat vung nho dong cho 
	p->data = x;
	p->pNext = NULL;
	return p;
}

// them mot node vao dau danh sach lien ket
void themVaoDau(LIST& l, NODE* p) {
	if (l.pHead == NULL) {
		l.pHead = l.pTail = p;
	}
	else {
		p->pNext = l.pHead; // con tro cua node p can cho vao lien ket voi node dau
		l.pHead = p;// cap nhat lai node p la node dau
	}
}

// them mot node vao cuoi danh sach lien ket
void themVaoCuoi(LIST& l, NODE* p) {
	if (l.pTail == NULL) {
		l.pHead = l.pTail = p;
	}
	else {
		l.pTail->pNext = p;// con tro cua node cuoi lien ket voi node p
		l.pTail = p;
	}
}

// tim max cua danh sach
int max(LIST& l) {
	int max = l.pHead->data;
	NODE* k;
	for (k = l.pHead; k != NULL; k = k->pNext) {
		if (k->data>max) {
			max = k->data;
		}
	}
	return max;
}

// ham xuat danh sach lien ket don
void xuatDanhSach(LIST l) {
	NODE* k;
	for (k = l.pHead; k != NULL; k = k->pNext) {
		cout << k->data << " ";
	}
}

void ThemNode_p_VaoSauNode_q(LIST& l, NODE* p) {
	int x;
	cin >> x;
	NODE *q = KhoiTaoNode(x);
	if (q->data == l.pHead->data && l.pHead->pNext == NULL) {
		themVaoCuoi(l, p);
	}
	else {
		for (NODE* k = l.pHead; k != NULL; k = k->pNext) {
			if (q->data == k->data) {
				NODE* h = KhoiTaoNode(p->data);
				NODE* g = k->pNext;//cho node g tro den node phia sau node q
				h->pNext = g;// Bước 1: Tạo mối liên kết từ node h đến node g <=> cũng chính là tạo mối liên kết từ node h đến node nằm sau node q
				k->pNext = h;// Bước 2: Tạo mối liên kết từ node q đến node h <=> chính là node k đến node h
			}
		}
	}
}

void Menu(LIST& l) {
	int luachon;
	while (6) {
		system("cls");
		cout << "\n\n\t\t========== Menu ==========";
		cout << "\n\t1. Them node vao danh sach";
		cout << "\n\t2. Xuat danh sach lien ket don";
		cout << "\n\t3. Them node p vao sau node q trong danh sach";
		cout << "\n\t0. Thoat";
		cout << "\n\n\t\t========== End ===========";

		cout << "\nNhap lua chon: ";
		cin >> luachon;

		if (luachon < 0 || luachon > 3)
		{
			cout << "\nLua chon khong hop le. Xin kiem tra lai !";
			system("pause"); // dừng màn hình
		}
		else if (luachon == 1)
		{
			int x;
			cout << "\nNhap gia tri so nguyen: ";
			cin >> x;
			NODE* p = KhoiTaoNode(x); // khởi tạo 1 cái node
			themVaoCuoi(l, p); // thêm node vào cuối danh sách
		}
		else if (luachon == 2)
		{
			xuatDanhSach(l);
			system("pause");
		}
		else if (luachon == 3)
		{
			int x;
			cout << "\nNhap gia tri node p can them vao sau: ";
			cin >> x;
			NODE* p = KhoiTaoNode(x);
			ThemNode_p_VaoSauNode_q(l, p); // thêm node p vào sau node q trong danh sách l
		}
		else
		{
			break; // thoát khỏi vòng lặp hiện tại
		}
	}
}

int main() {
	LIST l;
	KhoiTao(l); // luôn luôn gọi hàm khởi tạo danh sách liên kết đơn trước khi thao tác với danh sách
	Menu(l);
	system("pause");
	return 0;
}