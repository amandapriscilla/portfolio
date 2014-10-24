#ifndef _LINKEDLIST_H_
#define _LINKEDLIST_H_

template <class T>
class Node
{
    private:
    T value;
	Node<T> *refNext;

    public:
    Node(){ value = 0; refNext = NULL; }
    Node(T v){ value = v; refNext = NULL; }
    Node(T v, Node<T> node){ value = v; refNext = &node; }
    T getValue() { return value; }
    void setValue(T v) { value = v; }
    Node<T> *getNext() { return refNext; }
    void setNext(Node<T> *node) { refNext = node; }
	bool hasNext() { if(refNext != NULL) return true; return false; }

};

template <class T>
class LinkedList
{
    private:
	Node<T> *first;
	Node<T> *last;
	int size;

    public:
    LinkedList(){ size = 0; first = NULL; last = NULL; }
    LinkedList(T value){ Node<T> *node = new Node<T>(value); first = node; last = node; size = 1; }
    LinkedList(Node<T> *node){ first = node; last = node; size = 1; }
    LinkedList(Node<T> *n1, Node<T> *n2){ n1->setNext(n2); first = n1; last = n2; size = 2; }
    Node<T> *getFirst() { return first; }
    void setFirst(Node<T> *node) { first = node; }
    Node<T> *getLast() { return last; }
    void setLast(Node<T> *node) { last = node; }
    int getSize(){ return size; }

    T getValueAt(int pos)
    {
        Node<T> *aux = first;
        int nowAt = 0;
        while (aux != NULL){
            if(nowAt == pos)
            {
                return aux->getValue();
            }
           aux = aux->getNext();
        }
        return NULL;
    }

    void insert(T i){
		Node<T> *node = new Node<T>(i);
		if(size > 0){
			last->setNext(node);
		} else
		{
			first = node;
		}
		last = node;
		size++;
	}

    bool insertAt(T v, int pos)
    {
        Node<T> *newNode= new Node<T>(v);
        Node<T> *aux = first;
        Node<T> *prev = first;
        int nowAt = 0;
        while (aux != NULL){
            if(nowAt == pos)
            {
                if (pos == 0)
                {
                    newNode->setNext(aux);
                    first = newNode;
                } else
                {
                    newNode->setNext(aux);
                    prev->setNext(newNode);
                }
                size++;
                return true;
            }
            nowAt++;
            prev = aux;
            aux = aux->getNext();
        }

        if (nowAt == pos)
        {
            if (first == NULL)
            {
                first = newNode;
                last = newNode;
            } else
            {
                prev->setNext(newNode);
            }

            size++;
            return true;
        }

        return false;

    }

    int search(T i){
        int index = 0;
		Node<T> *node = first;
		while (node != NULL)
		{
			if(node->getValue() == i)
			{
				return index;
			}
			node = node->getNext();
			index++;
		}
		return -1;
	}

   bool remove(T i){
        Node<T> *node = first;
        Node<T> *previous = NULL;
		while (node != NULL)
		{
		    if (node->getValue() == i)
			{
			    if (node == first) // Remoção do primeiro elemento da lista
			    {
                     first = node->getNext();
                }
                else
                {
                    previous->setNext(node->getNext());
                }
                delete(node);
                size--;
				return true;
			}
			previous = node;
			node = node->getNext();
		}

		return false;
	}

	void printList(){
	    using std::cout;
	    using std::endl;
		Node<T> *node = first;
		cout << "{ ";
		while (node != NULL)
		{
			cout << node->getValue() << " ";
			node = node->getNext();
		}
		cout << " }"<<endl;
	}



};


#endif // LINKEDLIST_H
